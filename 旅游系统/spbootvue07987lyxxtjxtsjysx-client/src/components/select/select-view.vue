<template>
    <span class="e-select-view">
        {{content}}
    </span>
</template>
<style type="text/scss" lang="scss">

</style>
<script>
    import api from "@/api";

    export default {
        name: "e-select-view",
        data() {
            return {
                content:''
            }
        },
        props:{
            value:[String,Number],
            module:{
                type:String,
                required:true
            },
            select:{
                type:[String,Number],
                required: true
            },
            show:{
                type:[String,Number],
                required: true
            }
        },
        watch: {
            value(){
                this.getValue();
            }
        },
        computed: {},
        methods: {
            getValue(){
                if(this.value){
                    this.$post(api.search.selectView , {
                        table:this.module,
                        key:this.select,
                        value:this.value
                    }).then(res=>{
                        if(res.code == api.code.OK && res.data)
                        {
                            this.content = res.data[this.show];
                        }else{
                            this.content = '';
                        }
                    })
                }else{
                    this.content = '';
                }

            }
        },
        created() {
            this.getValue();
        },
        mounted() {
        },
        destroyed() {
        }
    }
</script>
