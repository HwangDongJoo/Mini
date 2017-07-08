<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>
   $(document).ready(function() {
	   //alert('${ param.movieId }');
      $.ajax({
         url : "https://apis.daum.net/contents/movie",
         type : "get",
         data : {
            apikey : "ca04355fcc9192c0eee3f0cebf5c7144",
            q : '${ param.title }',
            result : 1,
            output : "json"
         },
         dataType : "jsonp",
         success : callback,
         error : function() {   
            console.log('error');
         }
      });
       console.log($(this));
      $(this).on('hidden.bs.modal',function(e){
         //alert('close');
            var target = $(e.target);
            target.removeData('bs.modal').find(".modal-content").html('');         
         });
       
   });
   
   
   function callback(jsonData) {
      var itemList = jsonData.channel.item;
      console.log(itemList.length);
      for (var i = 0; i < itemList.length; i++) {
         var item = itemList[i];

         var title = item.title;
         var thumbnail = item.thumbnail;
         var story = item.story;

         console.log(title[0]);
         console.log(thumbnail[0]);
         console.log(story[0]);

         $('#imgArea1').append("<img src='"+thumbnail[0].content+"' width = \"220px\" height = \"316px\"/>");
         $('#textArea1').append(story[0].content);

      }
   }
   
   function doAction(title,movieId){
		location.href="/Mini/movie/detail.do?type=list&title="+title+'&movieId='+movieId;
}
</script>
      <div class="modal-header">
         <h4 class="modal-title">${ param.title }
         <!-- <script type="text/javascript">
            alert('${ param.title }');
         </script> -->
         </h4>
      </div>
      <div class="modal-body">
         <table>
            <tr>
               <td rowspan="2"><div class="col-xs-4" id="imgArea1"></div></td>
               <td>
               <input id="title1" type="hidden" value="${ param.title }" />
                  <h3>${ param.title }</h3>
               </td>
            </tr>
            <tr>
               <td><div class="col-xs-12" id="textArea1"></div></td>
            </tr>            
         </table>
      </div>
      <div class="modal-footer">
         <button type="submit" class="btn btn-default btn-default pull-left"
            data-dismiss="modal" id="cancelButton" onclick="doAction('${ param.title }',${param.movieId })">
            <span></span>상세보기
         </button>
         
         <button type="submit" class="btn btn-default btn-default pull-left"
            data-dismiss="modal" id="cancelButton">
            <span></span>닫기
         </button>
         
      </div>