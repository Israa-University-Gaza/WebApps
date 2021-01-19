


<template>
    <!-- BEGIN NOTIFICATION DROPDOWN -->
    <!-- DOC: Apply "dropdown-hoverable" class after "dropdown" and remove data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to enable hover dropdown mode -->
    <!-- DOC: Remove "dropdown-hoverable" and add data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to the below A element with dropdown-toggle class -->
    <li class="dropdown dropdown-extended dropdown-notification " id="header_notification_bar">
        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <i class="icon-bell"></i>
            <span class="badge badge-default">{{ Count }}</span>
        </a>
        <ul class="dropdown-menu hold-on-click">

            <li class="external">
                <h3>
                    You have
                    <strong>12 pending</strong> tasks
                </h3>
                <a href="app_todo.html">view all</a>
            </li>

            <li>
                <ul class="dropdown-menu-list scroller" style="height: 500px;" data-handle-color="#637283">
                    <li v-for="(item, key) in items">
                        <a>
                            <span @click="$delete(items, key)" class="time"> {{ item.InsertDate | formatDate }}</span>
                            <span class="details">
                                <span class="label label-sm label-icon label-success">
                                    <i class="fa fa-plus"></i>
                                </span> {{ item.Title }}.
                            </span>
                        </a>
                    </li>

                </ul>
            </li>
        </ul>
    </li>
    <!-- END NOTIFICATION DROPDOWN -->
</template>



<script>

    const axios = require('axios');
    export default {
        data:
            function () {
                return {
                    items: [],
                    loading: true,
                    errored: false
                }


            }
        ,
        beforeMount() {

            let that = this

            //signalr js code for start hub and send receive notification
            var notificationHub = $.connection.notificationHub;
            notificationHub.logging = true;
            $.connection.hub.start().done(function () { console.info('Notification hub started ' + "id : %o", $.connection.hub.id); });


            //signalr method for push server message to client
            notificationHub.client.notify = function (message) {
                that.items.unshift({ InsertDate: "1", Title: message });

            };

        },
        methods: {
            clearMessages() {
                this.messages = [];
            }
        },
        mounted() {
            axios
                .get('http://localhost:28406/app/GetAllNotifications?recipientID=5101')
                .then(response => {
                    this.items = response.data

                })
                .catch(error => {
                    console.log(error)
                    this.errored = true
                })
            //.finally(() => this.loading = false)
        },
        computed: {
            Count() {
                return this.items.length
            }
        }
    }


</script>








