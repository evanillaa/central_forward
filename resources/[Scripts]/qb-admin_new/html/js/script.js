var CurrentMenu = null;
var CurrentData = null;

$(document).on('click', '.spectate-button > p', function(e) {
    e.preventDefault();
    CurrentData = {serverid: $(this).data('serverid'), playername: $(this).data('playername')}
    $('.player-back-button').fadeOut(150)
    $('.current-player').html("<p>Selected: "+ CurrentData.playername + " #"+CurrentData.serverid+"</p>")
    $('.players-container').animate({"left": "40vh"}, 450, function() {
        $('.players-container').css("display", "none");
        setTimeout(function() {
            $('.player-options').css("display", "block");
            $('.player-options').animate({"left": "0vh"}, 450, function() {
                $('.player-back-button').fadeIn(150)
                CurrentMenu = ".player-options"
            })
          }, 50)
    })
});

$(document).on('click', '.player-back-button', function(e) {
    e.preventDefault();
    $(CurrentMenu).animate({"left": "40vh"}, 450, function() {
        $(CurrentMenu).css("display", "none");
        setTimeout(function() {
            $('.start-select').css("display", "block");
            $('.player-back-button').fadeOut(150)
            $('.start-select').animate({"left": "0vh"});
            CurrentMenu = ".start-select"
        }, 50)
    })
});

$(document).on('click', '.player-button', function(e) {
    e.preventDefault();
    var ClickType = $(this).data('type')
    if (ClickType == 'openinventory') {
        CloseAdminMenu()
        $.post('http://qb-admin_new/OpenInventoryPlayer', JSON.stringify({
            serverid: CurrentData.serverid
        }));  
    } else if (ClickType == 'giveclothing') {
        CloseAdminMenu()
        $.post('http://qb-admin_new/ClothingMenuPlayer', JSON.stringify({
            serverid: CurrentData.serverid
        })); 
    } else if (ClickType == 'kill') {
        $.post('http://qb-admin_new/KillPlayer', JSON.stringify({
            serverid: CurrentData.serverid
        }));  
    } else if (ClickType == 'revive') { 
        $.post('http://qb-admin_new/RevivePlayer', JSON.stringify({
            serverid: CurrentData.serverid
        }));  
    } else if (ClickType == 'kickplayer') {
        $.post('http://qb-admin_new/KickPlayer', JSON.stringify({
            serverid: CurrentData.serverid
        }));  
    }
});

$(document).on('click', '.player-button-bottom', function(e) {
    e.preventDefault();
    CloseAdminMenu()
});

$(document).on('click', '#player-options', function(e) {
    e.preventDefault();
    $('.start-select').animate({"left": "40vh"}, 450, function() {
        $('.start-select').css("display", "none");
        setTimeout(function() {
            $('.players-container').css("display", "block");
            $('.players-container').animate({"left": "0vh"}, 450, function() {
                $('.player-back-button').fadeIn(150)
                CurrentMenu = ".players-container"
            })
        }, 50)
    })
});

OpenAdminMenu = function() {
    CurrentMenu = ".start-select"
    $('.light-containter').css("display", "block");
    $('.light-containter').animate({"right": "1vh"}, 450)
    $.post('http://qb-admin_new/GetPlayers', JSON.stringify({}), function(Players){
        for (const [key, value] of Object.entries(Players)) {
            if (value.DeathState) {
                var PlayersContainer = '<div class="player-goto-options" id="total'+key+'"><div class="spectate-button"><p data-serverid="'+value.Serverid+'" data-playername="'+value.Name+'"><i class="fas fa-location-arrow"></i></p></div><p><i class="fas fa-user-tag"></i>   '+ value.Steam +' #'+value.Serverid+' (Dead)</p><p><i class="fas fa-user-shield"></i>   '+ value.Name +' ('+ value.Citizenid +')</p><p><i class="fas fa-user-cog" ></i>   '+ value.Job +'</p></div>';
            } else {
                var PlayersContainer = '<div class="player-goto-options" id="total'+key+'"><div class="spectate-button"><p data-serverid="'+value.Serverid+'" data-playername="'+value.Name+'"><i class="fas fa-location-arrow"></i></p></div><p><i class="fas fa-user-tag"></i>   '+ value.Steam +' #'+value.Serverid+' (Alive)</p><p><i class="fas fa-user-shield"></i>   '+ value.Name +' ('+ value.Citizenid +')</p><p><i class="fas fa-user-cog" ></i>   '+ value.Job +'</p></div>';
            }
            $('.player-container').append(PlayersContainer);
        }
    });
}

ResetAdminPage = function() {
    $(CurrentMenu).animate({"left": "40vh"}, 450, function() {
        $(CurrentMenu).css("display", "none");
        setTimeout(function() {
            $('.start-select').css("display", "block");
            $('.player-back-button').fadeOut(150)
            $('.start-select').animate({"left": "0vh"});
            CurrentMenu = ".start-select"
        }, 50)
    })
}

CloseAdminMenu = function() {
    $('.light-containter').animate({"right": "-45vh"}, 450, function() {
        $('.light-containter').css("display", "none");
        $('.player-container').html('');
        $('.current-player').html('<p>Nothing</p>');
        ResetAdminPage()
        $.post('http://qb-admin_new/CloseNui', JSON.stringify({}));
        CurrentMenu = null;
        CurrentData = null;
    }) 
}

document.onkeyup = function (data) {
    if (data.which == 27) { // Escape key
        ResetAdminPage()
        CloseAdminMenu()
    }
};

window.onload = function() {
  $('.player-back-button').fadeOut(750)
  $('.player-back-button-2').fadeOut(750)
  $('.players-container').fadeOut(750)
}

window.addEventListener('message', function(event) {
    switch(event.data.action) {
        case "openadmin":
            OpenAdminMenu(event.data);
            break;
    }
});