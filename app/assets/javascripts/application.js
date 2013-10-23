// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  // Force links to open in new windows
  $('a').attr("target", "_blank");

  // Fade out completed task and append to Recently Completed list
  $('.task-exp').on('click', function(e) {
    var li = $(this).closest('li');
    if (li.parent().hasClass('active')) {
      // var completed = confirm("Complete Task?")
      var completed = true;
      if (completed) {
        li.fadeOut("slow",function (){
          $(".recently-completed").append(li);
          li.fadeIn();  
        });
      }
    }
  });

  // Listen for edit pencil clicks
  $('.edit-pencil').on('click', function(e) {  
      alert("Edit Task");
  });    

  // Focus on single character, fade out rest
  var $team = $('.team li'),
      $teamList,
      id,
      url,
      flag;
  $team.on('click',function() {
    $team = $('.team li')
    $teamList = $('.team')
    _this = $(this)
    $edit = $('.edit-character')
    id = _this.data().id
    flag = true;

    $(this).toggleClass('active-character');    

    if ($edit.length) {
      $edit.remove();
    }

    if (_this[0] == $team.first()[0]) {
      $team.not(_this).fadeToggle(function(){

        if (flag) {
          editCharacter();
          flag=false;
        }

      });
    }
    else {
      $team.fadeToggle("fast",function(){
        $teamList.prepend(_this);
        _this.fadeIn(300);  

        if (flag) {
          editCharacter();
          flag=false;
        }        

      });      
    }

    function editCharacter(){
      if ($edit.length) {
        $edit.remove();
      }
      else {
        url = "/characters/" + id + "/edit"
        $.get(url,function(data){
          $teamList.append(data);
          $('.edit-character').fadeIn(350,function(){
            $('.edit-contents').fadeIn(250,function(){

              // Change Job Logic
              $('.available-job').on('click',function(){
                // alert($(this).data().jobid);
                var imageurl = $(this).find('img').attr('src').replace('SW','S');
                var $character = $('.current-job img');
                $character.fadeOut(function(){
                  $character.attr('src',imageurl);
                  $character.fadeIn();
                });
              });

              $('.jobs-more').on('click',function(){
                $('.character-jobs li').not('.current-job').slice(0,10).hide();
              });  

              $('.jobs-more2').on('click',function(){
                $('.character-jobs li').not('.current-job').slice(0,20).hide();
              });             

              $('.jobs-back').on('click',function(){
                $('.character-jobs li').not('.current-job').show();
              });  

            });
          });
        })      
      }

    }

     
  });
});