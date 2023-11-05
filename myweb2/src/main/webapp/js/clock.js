        
        
        
        function showtime(){
            let now = moment();
            moment.locale("ko");
            var fullDate=now.format("YYYY年MM月DD日 HH:mm:ss");
            $("#clock").text(fullDate);
        }//showtime() end

        setInterval(showtime,1000);