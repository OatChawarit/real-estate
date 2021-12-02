/*
 * @Function Help & Covert Etc.
 */


///////////////

Date.isLeapYear = function (year) {
    return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0));
};

Date.getDaysInMonth = function (year, month) {
    return [31, (Date.isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
};

Date.prototype.isLeapYear = function () {
    return Date.isLeapYear(this.getFullYear());
};

Date.prototype.getDaysInMonth = function () {
    return Date.getDaysInMonth(this.getFullYear(), this.getMonth());
};

Date.prototype.addMonths = function (value) {
    var n = this.getDate();
    this.setDate(1);
    this.setMonth(this.getMonth() + value);
    this.setDate(Math.min(n, this.getDaysInMonth()));
    return this;
};


function AddDay(strDate, intNum)
{
	sdate =  new Date(strDate);
	sdate.setDate(sdate.getDate()+intNum);
    return sdate.getMonth() + 1 + "-" + sdate.getDate() + "-" + sdate.getFullYear();
}

function monthAdd(strDate, num) {
    let newDate = new Date(strDate);
    //var newDate = new Date(date.setMonth(date.getMonth() + 8));
   // console.log(newDate)
    return newDate.addMonths(parseInt(num));
    //return newDate.setMonth(newDate.getMonth() + +num);
}


function yearAdd(strDate, num) {

    let newDate = new Date(strDate);
    var month = 0;
    for (i = 0; i < num; i++) {
        let monthplus = 12;
        month = parseInt(month) + parseInt(monthplus)
    }
    return newDate.setMonth(newDate.getMonth() + month);
}

/* Diff month d1 as String date 
 */
function monthDiff(d1) {
    let date1 = new Date(d1);
    let date2 = new Date();
    var months;
    months = (date2.getFullYear() - date1.getFullYear()) * 12;
    months -= date1.getMonth() + 1;
    months += date2.getMonth();
    return months <= 0 ? 0 : months;
}


/// วันปัจุบัน
/* Get date string format
 */
function nowDateString() {
    let today = new Date();
    let year = today.getFullYear(); 
    let dd = today.getDate();
    let mm = today.getMonth() + 1; //มกราคม = 0!
    let result;
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    result = year + "-" + mm + "-" + dd;
    return result;
}

function dateFormat(strDate) {
    let today = new Date(strDate);
    let year = today.getFullYear();
    let dd = today.getDate();
    let mm = today.getMonth() + 1; //มกราคม = 0!
    let result;
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    result = year + "-" + mm + "-" + dd;
    return result;
}

///  แปลง format dd-mm-yyyy  >> yyyy-mm-dd
function reverseFormatDate(date) {
    date = date.split(/[-/]+/).reverse().join("-");
    return date;
}
 

// แปลง ตังอักษรวันที่ เป็น วันที่
/*
 * Convert string date to Date time stamp 
 */
function getDate(strDate) {
    //console.log(strDate);
    let mydate = new Date(strDate);
    let year = mydate.getFullYear();
    let dd = mydate.getDate();
    let mm = mydate.getMonth() + 1; //มกราคม = 0!
    let result;

    result = new Date(year, mm, dd);
    return result;
}

/*
 * Find array value by key
 * @array your array
 * @key key cytiral
 * @value value to find
 */
function findObjectByKey(array, key, value) {
    for (var i = 0; i < array.length; i++) {
        if (array[i][key] === value) {
            return array[i];
        }
    }
    return null;
}

/*
 * Get Array Object By key 
 * @array Your array object
 * @key Your key crytirl
 * @value Your value of find
 * @result Return value
 */
function getObjectByKey(array, key, value, result) {
    for (var i = 0; i < array.length; i++) {
        if (array[i][key] === value) {
            return array[i][result];
        }
    }
    return null;
}


var mydate = AddDay("2019-10-10", 90);
mydate = dateFormat(mydate);
//console.log(mydate);



function money_format(nStr) {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

function money_unformat(nStr) {
    var noCommas = nStr.replace(/,/g, '')
    return noCommas;
}

function percent_Balance(namebank) {
  //  alert(namebank);
    if (namebank == "KB") {
        percent = 70;
    }
    else if (namebank == "LH") {
        percent = 100; //100
        
    }
    else if (namebank == "SMBC") {
        percent = 70; //100
    }
    else {
        percent = 70;
    }
   // alert(percent)
    return percent;
}

function cal_withdrawal_money(namebank, TxtWd_Money_Sum) {
    let result = 0;
    //alert(namebank)
    if (namebank == "KB") {
        let cal_money = TxtWd_Money_Sum / 100000;
        result = Math.floor(cal_money) * 100000;
    }
    else if (namebank == "LH") {
        let cal_money = TxtWd_Money_Sum / 10000;
        result = Math.floor(cal_money) * 10000;
    }
    else if (namebank == "SMBC") {
        result = TxtWd_Money_Sum;
    }
    else {
        result = TxtWd_Money_Sum;
    }
    return result;
}

$(document).on('change', 'input[type=date]', function () {
    let value = $(this).val();
    let yearValue = parseInt(value.substring(0, 4));
    if (yearValue > 2450) {
        let newYear = yearValue - 543;
        let newDate = "" + newYear + "" + value.substring(4, 20);
        $(this).val(newDate);
    }
    //alert(value);
});


function progredBar(t) {
    let timerInterval
    Swal.fire({
        title: 'Auto close alert!',
        html: 'กำลังโหลด <b></b> milliseconds.',
        timer: t,
        timerProgressBar: true,
        didOpen: () => {
            Swal.showLoading()
            timerInterval = setInterval(() => {
                const content = Swal.getContent()
                if (content) {
                    const b = content.querySelector('b')
                    if (b) {
                        b.textContent = Swal.getTimerLeft()
                    }
                }
            }, 100)
        },
        willClose: () => {
            clearInterval(timerInterval)
        }
    }).then((result) => {
        /* Read more about handling dismissals below */
        if (result.dismiss === Swal.DismissReason.timer) {
            console.log('I was closed by the timer')
        }
    })
}

function startScript() {
    $.ajax({
        cache: false,
        type: 'GET',
        url: urlBackEndMeeconnect + "/my-ip",
        data: JSON.stringify(body),
        beforeSend: function (request) {
            request.setRequestHeader("Content-Type", "application/json");
            request.setRequestHeader("token", tokenMeeconnect);
            request.setRequestHeader("username", username);
        }
    }).done(function (data) {
        $("#tbIp").html(data.myip);
    });
}



//Lock Modal close
function LockModal(ModalId) {
    var $modal = $(ModalId);
    var keyboard = false; // Prevent to close by ESC
    var backdrop = 'static'; // Prevent to close on click outside the modal

    if (typeof $modal.data('bs.modal') === 'undefined') { // Modal did not open yet
        $modal.modal({
            keyboard: keyboard,
            backdrop: backdrop
        });
    } else { // Modal has already been opened
        $modal.data('bs.modal')._config.keyboard = keyboard;
        $modal.data('bs.modal')._config.backdrop = backdrop;

        if (keyboard === false) {
            $modal.off('keydown.dismiss.bs.modal'); // Disable ESC
        } else { // 
            $modal.data('bs.modal').escape(); // Resets ESC
        }
    }
}


//Clear Modal
function ClearModal(ModalId) {
    $("input[type='text']").val(""); //Reset TextBox
    $("input[type='password']").val(""); //textbox password
    /*var NowDate = new Date();
    $("input[type='date']").val(formatDate(NowDate));*/
    $("select").val(""); //Reset --เลือก--
}

function HideTopbar(status) {
    if (status == 1) {
        $("#top_bar").addClass("d-none");
    } else {
        $("#top_bar").removeClass("d-none");
    }
 

}