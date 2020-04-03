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
- basename은 모르겠음.

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
