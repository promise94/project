 //创建和初始化地图函数：
 function initMap() {
     createMap(); //创建地图
     setMapEvent(); //设置地图事件
     addMapControl(); //向地图添加控件
     addMapOverlay(); //向地图添加覆盖物
 }

 function createMap() {
     map = new BMap.Map("map");
     map.centerAndZoom(new BMap.Point(110.335087, 20.063247), 17);
 }

 function setMapEvent() {
     map.enableScrollWheelZoom();
     map.enableKeyboard();
     map.enableDragging();
     map.enableDoubleClickZoom()
 }

 function addClickHandler(target, window) {
     target.addEventListener("click", function () {
         target.openInfoWindow(window);
     });
 }

 function addMapOverlay() {
     var markers = [{
             content: "酒店1",
             title: "帝豪",
             imageOffset: {
                 width: 0,
                 height: 3
             },
             position: {
                 lat: 20.062551,
                 lng: 110.335033
             }
         },
         {
             content: "酒店2",
             title: "帝豪",
             imageOffset: {
                 width: 0,
                 height: 3
             },
             position: {
                 lat: 20.066201,
                 lng: 110.339112
             }
         },
         {
             content: "酒店2",
             title: "帝豪",
             imageOffset: {
                 width: 0,
                 height: 3
             },
             position: {
                 lat: 20.066659,
                 lng: 110.333129
             }
         },
         {
             content: "酒店3",
             title: "帝豪",
             imageOffset: {
                 width: 0,
                 height: 3
             },
             position: {
                 lat: 20.059495,
                 lng: 110.337746
             }
         }
     ];
     for (var index = 0; index < markers.length; index++) {
         var point = new BMap.Point(markers[index].position.lng, markers[index].position.lat);
         var marker = new BMap.Marker(point, {
             icon: new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png", new BMap.Size(20, 25), {
                 imageOffset: new BMap.Size(markers[index].imageOffset.width, markers[index].imageOffset.height)
             })
         });
         var label = new BMap.Label(markers[index].title, {
             offset: new BMap.Size(25, 5)
         });
         var opts = {
             width: 200,
             title: markers[index].title,
             enableMessage: false
         };
         var infoWindow = new BMap.InfoWindow(markers[index].content, opts);
         marker.setLabel(label);
         addClickHandler(marker, infoWindow);
         map.addOverlay(marker);
     };
 }
 //向地图添加控件
 function addMapControl() {
     var scaleControl = new BMap.ScaleControl({
         anchor: BMAP_ANCHOR_BOTTOM_RIGHT
     });
     scaleControl.setUnit(BMAP_UNIT_METRIC);
     map.addControl(scaleControl);
     var navControl = new BMap.NavigationControl({
         anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
         type: 0
     });
     map.addControl(navControl);
     var overviewControl = new BMap.OverviewMapControl({
         anchor: BMAP_ANCHOR_TOP_LEFT,
         isOpen: true
     });
     map.addControl(overviewControl);
 }
 var map;
 initMap();