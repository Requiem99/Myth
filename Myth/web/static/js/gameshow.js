$(function (){
    function gameCheck(){
        var gamesId = $(".game-id");
        var addList = $(".add-list");
        /*console.log(gamesId);
           console.log(addList);*/
        for (let i = 0; i < gamesId.length; i++) {
            $.get("checkHaveGame/" + gamesId[i].value, function (verify) {
                console.log(gamesId[i].value)
                if (verify[0] === true && verify[1] === false) {//愿望清单中没有该游戏,仓库中有
                    addList[i].innerHTML='<span class="glyphicon glyphicon-ok"></span> 游戏已在仓库中'
                } else if (verify[0] === false && verify[1] === true) {//愿望清单中有该游戏,仓库中没有
                    addList[i].innerHTML='<span class="glyphicon glyphicon-ok"></span> 游戏已在愿望清单中'
                }
            })
        }
    }
})


