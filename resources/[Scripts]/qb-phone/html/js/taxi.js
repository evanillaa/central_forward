SetupDrivers = function(data) {
    $(".driver-list").html("");

    if (data.length > 0) {
        $.each(data, function(i, taxi){
            var element = '<div class="taxi-list" id="taxiid-'+i+'"> <div class="taxi-list-firstletter">' + (taxi.name).charAt(0).toUpperCase() + '</div> <div class="taxi-list-fullname">' + taxi.name + '</div> <div class="taxi-list-call"><i class="fas fa-phone"></i></div> </div>'
            $(".driver-list").append(element);
            $("#taxiid-"+i).data('taxiData', taxi);
        });
    } else {
        var element = '<div class="taxi-list"><div class="no-driver">There are no taxi drivers on duty.</div></div>'
        $(".driver-list").append(element);
    }
}

$(document).on('click', '.taxi-list-call', function(e){
    e.preventDefault();

    var taxiData = $(this).parent().data('taxiData');
    
    var cData = {
        number: taxiData.phone,
        name: taxiData.name
    }

    $.post('http://qb-phone_new/CallContact', JSON.stringify({
        ContactData: cData,
        Anonymous: QB.Phone.Data.AnonymousCall,
    }), function(status){
        if (cData.number !== QB.Phone.Data.PlayerData.charinfo.phone) {
            if (status.IsOnline) {
                if (status.CanCall) {
                    if (!status.InCall) {
                        if (QB.Phone.Data.AnonymousCall) {
                            QB.Phone.Notifications.Add("fas fa-phone", "Phone", "You started a secret search!");
                        }
                        $(".phone-call-outgoing").css({"display":"block"});
                        $(".phone-call-incoming").css({"display":"none"});
                        $(".phone-call-ongoing").css({"display":"none"});
                        $(".phone-call-outgoing-caller").html(cData.name);
                        QB.Phone.Functions.HeaderTextColor("white", 400);
                        QB.Phone.Animations.TopSlideUp('.phone-application-container', 400, -160);
                        setTimeout(function(){
                            $(".taxi-app").css({"display":"none"});
                            QB.Phone.Animations.TopSlideDown('.phone-application-container', 400, 0);
                            QB.Phone.Functions.ToggleApp("phone-call", "block");
                        }, 450);
    
                        CallData.name = cData.name;
                        CallData.number = cData.number;
                    
                        QB.Phone.Data.currentApplication = "phone-call";
                    } else {
                        QB.Phone.Notifications.Add("fas fa-phone", "Phone", "You are busy!");
                    }
                } else {
                    QB.Phone.Notifications.Add("fas fa-phone", "Phone", "The number you are calling is busy!");
                }
            } else {
                QB.Phone.Notifications.Add("fas fa-phone", "Phone", "The person's phone is off!");
            }
        } else {
            QB.Phone.Notifications.Add("fas fa-phone", "Phone", "You cannot call your own number..");
        }
    });
});
