# 주소 검색 시 위도경도 자동 변환
- 다음 우편번호 api 이용
- api 주소 검색 결과를 파라미터로 카카오 로컬 api 위도경도 변환   

```javascript
<script>
function mapsearch(){
  
  //다음 우편번호 로컬 api 검색결과
	var address = $('input[name=address]').val();
  
	var geocoder2 = new kakao.maps.services.Geocoder();
	geocoder2.addressSearch(address, function(result, status) {

	    // 다음 우편번호 로컬 api 검색결과를 파라미터로 위도경도 탐색
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
	        var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ';
			message += result[0].x + ')';	

	        // 결과값으로 받은 위치를 마커로 표시
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });


	        // 지도의 중심을 결과값으로 받은 위치로 이동
	        map.setCenter(coords);
	        
	        $('input[name=locationlati]').val(result[0].y);
	    	$('input[name=locationlongi]').val(result[0].x);
	    } 
	});
	
	
}
</script>
```
