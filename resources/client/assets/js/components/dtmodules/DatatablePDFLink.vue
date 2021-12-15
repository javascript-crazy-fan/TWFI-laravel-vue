<template>
    <div class="btn-group btn-group-xs">
        <button @click="pdfData(row.id)" type="button" class="">
            PDF
        </button>
   </div>
</template>


<script>
export default {
    props: ['row', 'xprops'],
    data() {
        return {
            // Code...
        }
    },
    created() {
        // Code...
    },
    methods: {
        pdfData(id) {
            
                
            this.$store.dispatch(
                this.xprops.module + '/pdfData',
                id
            )
                
        
        }
    }
}
</script>


<style scoped>

</style>
