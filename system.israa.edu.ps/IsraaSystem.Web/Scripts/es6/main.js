


import moment from 'moment';





import Vue from 'vue'
import dropdownnotification from './dropdown-notification.vue'
import BootstrapCard from './BootstrapCard.vue';


//Vue.component('bootstrap-card', {  });


//new Vue({
//    el: '#vue-app',
//    render: h => h(App)
//});


Vue.filter('formatDate', function (value) {
    if (value) {
        return moment(String(value)).format('MM/DD/YYYY');
    }
});


//new Vue(vmApp).$mount('#header_notification_bar')





// Define a new component called button-counter
Vue.component('bootstrap-card', BootstrapCard);
Vue.component('dropdown-notification', dropdownnotification);



new Vue({ el: '#vue-app' })





