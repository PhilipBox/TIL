## Cap & Join

### CAP : 선의 끝나는 지점의 장식을 설정 
e.g.) Pnt.setStrokeCap(Paint.Cap.ROUND); <br>
`ROUND` : 둥근 모양으로 끝이 장식됨. <br>
e.g.)Pnt.setStrokeCap(Paint.Cap.SQUARE); <br>
`SQUARE` : 사각형 모양이며, 해당 좌표보다 조금 더 길게 그려짐. <br>
e.g.)Pnt.setStrokeCap(Paint.Cap.BUTT);<br>
`BUTT` : 정해진 위치에서 끝남! (아마도 default 값인 것 같음!)<br>

예제에 사용된 모든 Line은 같은 길이로 설정하였음.<br>
약간의 길이차이가 느껴지는 것은 CAP style때문에 그런 것이라는 것 인지하기!<br><br>

### Join : 선의 끝 모양을 설정
e.g.) Pnt.setStrokeJoin(Paint.Join.MITER); <br>
Join - `MITER` : 모서리를 각진 모양으로 만듦.<br>
e.g.) Pnt.setStrokeJoin(Paint.Join.BEVEL);<br>
Join - `BEVEL` : 모서리가 둥글게 살짝 깍인 모양으로 만듦.<br>
e.g.)Pnt.setStrokeJoin(Paint.Join.ROUND);<br>
Join - `ROUND` : 모서리를 둥근 모양으로 만듦.<br>
