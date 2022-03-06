<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Slot-插槽</title>
  <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
</head>
<body>
<div id="app">
  <tudo>
    <tudo-Title slot="tudo-Title" v-bind:title="Title"></tudo-Title>
    <tudo-Items slot="tudo-Items" v-for="item in Items" v-bind:item="item"></tudo-Items>
  </tudo>
</div>

<script>
  Vue.component("tudo",{
    template:'<div>\
                        <slot name="tudo-Title"></slot>\
                        <ul>\
                            <slot name="tudo-Items"></slot>\
                        </ul>\
                      </div>'
  })

  Vue.component("tudo-Title",{
    props:['title'],
    template:'<h3>{{title}}</h3>'
  });

  Vue.component("tudo-Items",{
    props:['item'],
    template:'<li>{{item}}</li>'
  });
  var vm = new Vue({
    el:'#app',
    data:{
      Title:"离思五首·其四",
      Items:[
        "曾经沧海难为水，",
        "除却巫山不是云。",
        "取次花丛懒回顾，",
        "半缘修道半缘君。"]
    }
  })
</script>
</body>
</html>