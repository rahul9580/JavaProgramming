		$(document).ready(function()
		{
			$("ul.categoryfilter span.name").click(function()
			{
				var $li = $(this).parent("li").has("ul");
				if($li.find("ul").hasClass("open"))
				{
					$li.find("ul").slideUp('slow', function( )
					{
						$li.removeClass("open");
						$li.find("ul").removeClass("open");
						$li.find("ul").addClass("close");
					});
				}
				else
				{
					$li.addClass("open");
					$li.find("ul").removeClass("close");
					$li.find("ul").addClass("open");
					$li.find("ul").slideDown('slow');
				}
			});
			$("input.statusswitch").click(function()
			{
				var subcat = $(this).attr("alt");
				
				subcatAccess = subcat.split(";")[2];
				var priv = subcat.split(";")[3];
				if($(this).is(":checked"))
				{
					if((confirm("Are you sure you want to enable this?"))&&((subcatAccess.toLowerCase()==='approve')||(priv.toLowerCase()==='admin'))){
					$.ajax(
					{
						type : "POST",
						dataType: 'html',
						url : '/PriceSimulator/ajax/subcatstatus.action?subcatStatus=1',
						data : { cat : subcat, status : 1},
						success : function(data)
						{
							if(data == 1) 		alert("Sub-Category has been ENABLED");	
							else				alert("Internal Error. Sub-Category activation failed");
							location.reload();
						}
					});	
					}
					else
						{
						$(this).prop('checked', false);
						}
				}
				else
				{
					
					if((confirm("Are you sure you want to disable this?"))&&((subcatAccess.toLowerCase()==='approve')||(priv.toLowerCase()==='admin'))){
					$.ajax(
					{
						type : "POST",
						dataType: 'html',
						url : '/PriceSimulator/ajax/subcatstatus.action?subcatStatus=0',
						data : { cat : subcat, status : 0},
						success : function(data)
						{
							if(data==1)			alert("Sub-Category has been DISABLED. \nAll rules associated with this subcategory are deleted.");
							else				alert("Internal Error. Sub-Category deactivation failed");
							location.reload();
						}
					});
					}
					else
					{
					$(this).prop('checked', true);
					}
				}
			});
		});