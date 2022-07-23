# 좋아요 평점 기능 구현
### 생각할 점
- 한사람당 하나의 맛집에는 한번의 좋아요만 가능
  - 맛집 테이블과 회원테이블을 연결한 좋아요 테이블 이용, 테이블의 데이터를 비교하여 좋아요 제한
- 새로고침 없이 좋아요 변경 여부 반영
  - ajax의 이해도가 부족하여 대체 방법 강구
  - 새창을 열어 서버 작업 후, 작업이 완료되면 새창 닫기
- 평점 기능
  - 해당 맛집과 연결된 리뷰 테이블의 평점 평균 계산   

```javascript
    <script>
    	$(function(){
    		$('#nolike').click(function(){
    			window.open('storeLike.jsp?stno=<%=no%>&memno=<%=userno%>&like=<%=1%>',"", "_blank");
    			alert('해당 맛집을 추천하셨습니다');
    			
    		});
    		
    		$('#like').click(function(){
    			window.open('storeLike.jsp?stno=<%=no%>&memno=<%=userno%>&like=<%=2%>',"", "_blank");
    			alert('해당 맛집 추천을 취소하셨습니다');

    		});

    	});
    </script>
```
