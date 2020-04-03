# BigData Project Flow
> initialize.py(sub2/backend/api/management/commands/initialize.py)
>여기서는 Sub1에서 생성했한 Dataframe(pickle type)을 Django에서 사용할 DB에 저장하는 초기화 작업을 해준다.
>즉, JSON type의 방대한 데이터를 Sub1에서 정제를 하고, Django에서 사용하기 위한 형태로 초기화를 해준 것.
>[model type으로 변환] 

## BackEnd Flow
#### sub2/backend/backend/urls.py
- python run server를 실행하면 처음에 이 urls로 오게 된다.
- 가장 밑단이 되는 부분이고, 내부 코드에 따라서 api면 sub2/backend/api/urls.py로 이동한다. 

#### sub2/backend/api/urls.py
```python
router.register(r"stores", views.StoreViewSet, basename="stores")
```
- 첫 번째 파라미터의 ```r'stores'```는 아규먼트로 stores를 호출했던 것을 칭한다. (입구같은 것)
- ```views.StoreViewSet``` 를 처리하기 위해서  sub2/backend/api/views.py로 이동.
- basename은 생성된 URL 이름에 사용. 만약 설정되어 있지 않은 경우 basename은 자동적으로 viewset의 attribute의 queryset을 기반하여 생성함. 만약 viewset이 queryset attribute를 포함하지 않는다면, 사용자는 viewset을 등록할 때 basename을 지정해야 함.

#### sub2/backend/api/views.py
- 앞에서 views.StoreViewSet을 호출했으므로 StoreViewSet class로 이동.
- ```serializer_class = serializers.StoreSerializer``` 는 serializers.py로 이동하여 처리한다. (직렬화)

	- #### sub2/backend/api/serializers.py
		- 첫 번째 줄, ```from .models import Store``` 을 보면 model의 Store를 import 하고 있다.
		- 이것은 초기에 initialize.py를 통해서 Dataframe을 model형태로 바꿔준 것이다.
		- **Serialize를 하는 이유는, 지금처럼 model과 같이 복잡한 형태를 JSON이나 XML 또는 다른 유형으로 변환해주기 위함이다.**
```python
class  StoreSerializer(serializers.ModelSerializer):
	class  Meta:
		model = Store
			fields = [
				"id",
				"store_name",
				"branch",
				"area",
				"tel",
				"address",
				"latitude",
				"longitude",
				"category_list",
			]
``` 
- model의 형태에 맞는 테이블 컬럼을 생성해줌. 
- 다시 **sub2/backend/api/views.py**로이동.
- ```pagination_class = SmallPagination``` 는 페이징 관련 처리를 해주는 것.
- ``` def get_queryset(self)``` 를 통해서 만들어줬던 컬럼에 실제 데이터를 삽입한다.
```python
def  get_queryset(self):
	name = self.request.query_params.get("name", "")
	queryset = (
		models.Store.objects.all().filter(store_name__contains=name).order_by("id")
	)
	return queryset
```

#### sub2/backend/api/urls.py
- 이곳으로 돌아와서, ```views.StoreViewSet``` 가 끝나게 되면 model을 직렬화까지 마치고 데이터까지 삽입된 결과를 요청받았던 곳으로 돌려주게 된다.
- 이곳의 정확한 코드분석은 아직.

<hr><hr><br>

## FrontEnd Flow
> frontend/src/views/Search.vue 에서 Store의 정보를 요청하는 흐름을 예시로 듦.

### frontend/src/views/Search.vue
- 특정 버튼을 클릭하게되면 ```onSubmit```  함수가 실행됨.
```python
onSubmit:  async  function() {
	const  params = {
		name:  this.storeName,
		page:  1,
		append:  false
	};
	await  this.getStores(params);
	this.loading = false;
}
```
- params에 3개의 arguments를 지정하고``` getStores(params)``` 를 실행한다.
-  바로 위에 있던 ```...mapActions("data", ["getStores"])``` 에 있는 getStores를 칭한다. 
- getStores를 보기 위해서는 actions가 정의되어 있는 곳으로 이동한다. 
- **frontend/src/store/modules/data.js** 이곳에 **actions**와 **mutations**가 정의되어 있다. 

### frontend/src/store/modules/data.js
- initial state로 변수들이 초기화되어 있음.
```python
// initial state
const state = {
  storeSearchList: [],
  storeSearchPage: "1",

  reviewSearchList: [],
  reviewSearchPage: "1",

  store: {
    id: "",
    name: "",
    branch: "",
    area: "",
    tel: "",
    address: "",
    lat: 0.0,
    lng: 0.0,
    categories: []
  },

  review: {
    id: "",
    store: "",
    store_name: "",
    user: "",
    score: "",
    content: "",
    reg_time: {}
  }
};
```
- actions이 선언되어 있음.
```python
const actions = {
  async getStores({ commit }, params) {
    const append = params.append;
    const resp = await api.getStores(params);
    const stores = resp.data.results.map(d => ({
      id: d.id,
      name: d.store_name,
      branch: d.branch,
      area: d.area,
      tel: d.tel,
      address: d.address,
      lat: d.latitude,
      lng: d.longitude,
      categories: d.category_list
    }));

    if (append) {
      commit("addStoreSearchList", stores);
    } else {
      commit("setStoreSearchList", stores);
    }
    commit("setStoreSearchPage", resp.data.next);
  }
};
```
- ```async  getStores({ commit }, params)``` 에서 commit은 실행할 부분을 의미, params를 파라미터로 전달받은 것.
- ```const  append = params.append;```  에서 params로 들어왔던 append를 따로 저장함( 첫 페이지일 경우 false, 추가로 데이터를 요구하는 경우 true)
- ```const  resp = await  api.getStores(params);``` 에서는 backend에 데이터를 요청하여 rest에 저장함.
- ```const  stores = resp.data.results.map(d  => .({..생략...}));``` backend에서 요청해 저장받은 데이터가 저장된 resp의 데이터를 각각의 형식에 맞게 mapping 시킴.
-  ```append```의 값(true/false)에 따라 실행시킬 mutation을 지정함. (add or set )
- ```commit("setReviewSearchPage", resp.data.next);``` append에 상관없이 실행시킬 mutation을 실행.
- ```mutations```는 받아왔던 데이터를 처음 맵핑시키거나, 추가로 concat하여 붙이는 과정, page처리를 하는 과정 등의 행동을 취하는 것들을 정의해 놓았다.
```python
// mutations
const mutations = {
  setStoreSearchList(state, stores) {
    state.storeSearchList = stores.map(s => s);
  },
  addStoreSearchList(state, stores) {
    state.storeSearchList = state.storeSearchList.concat(stores);
  },
  setStoreSearchPage(state, url) {
    state.storeSearchPage = new URL(url).searchParams.get("page");
  }
};
```
