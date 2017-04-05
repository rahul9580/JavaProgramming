/**
 * 
 */

	




	function validateInput(evt)
	{
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		if (key == 8 ) {
			theEvent.returnValue = true ;
			return;
		}
		key = String.fromCharCode( key );
		 var regex = /[0-9-]|\./;
		if(!regex.test(key))
		{
			theEvent.returnValue = false;
			if(theEvent.preventDefault) theEvent.preventDefault();
		}   
		
	}
	
	function change() {
		var sellerType = $(".SellerType :selected").val() ;
		if (sellerType == "0") {
			$("#SellerLeftList option").addClass("hidden") ;
		}
		else {
			$("#SellerLeftList option").removeClass("hidden") ;
			selectedSellerList = {} ;
			$("#SellerRightList option").each(function () {
				var value = $(this).val() ;
				$('#SellerLeftList option').each(function() {
				    if ( $(this).val() == value ) {
				        $(this).remove();
				    }
				});
			});
		}
	}
		
	function fetchSubcatConfigurationDataCtrl ($scope , $http) {
		http.get("manageSubcat.action?action=fetchSubcatConfigurationData")
	    .then(function(response) {
	    	$scope.myWelcome = response.data;
	    	var jsonData = angular.toJson(response.data);
	    	jsonData = JSON.parse(jsonData);
	        for ( key in jsonData) {
	        	if (jsonData.hasOwnProperty(key)) {
	        		$(".configurationData").append("<label>" +key + "</label>" +  "<input type='text' value=" + jsonData[key] + "><br>");
	        	}
	        }
	    });
	}
	

	var subcatConfigurationApp = angular.module('subcatConfApp',[]);
	subcatConfigurationApp.config(['$controllerProvider', function($controllerProvider) {
		  $controllerProvider.allowGlobals();
		}]);

	function fetchSellerListCtrl ($scope , $http) {
		$http.get("manageSubcat.action?action=fetchAllSeller")
	    .then(function(response) {
	    	var jsonData = angular.toJson(response.data);
	    	jsonData = JSON.parse(jsonData);
	    	$scope.sellerType =  $(".SellerType :selected").val() ;
	        $scope.sellerList = jsonData;
	    });
	}
	
	function fetchSelectedSellerCtrl($scope,$http) {
		$http.get("manageSubcat.action?action=fetchCostOptSeller")
	    .then(function(response) {
	    	var jsonData = angular.toJson(response.data);
	    	jsonData = JSON.parse(jsonData);
	    	var sellectedSellerListLength = Object.keys(jsonData).length;
	    	if (sellectedSellerListLength > 0 ) {
	    		$('.SellerType option[value=1]').attr('selected','selected');
	    	}
	    	else {
	    		$('.SellerType option[value=0]').attr('selected','selected');
	    		
	    	}
	    	$scope.selectedSellerList=jsonData;

	    });
	}
	
	function contains ( key , array ) {
		for ( var i = 0 ; i < array.length ; i++ ) {
			if ( array [i ] === key ) {
				return true;
			}
		}
		return false;
	}
	
	function fetchSubcatConfigurationDataCtrl ($scope , $http) {
		$http.get("manageSubcat.action?action=fetchSubcatConfigurationData")
	    .then(function(response) {
	    	var jsonData = angular.toJson(response.data);
	    	jsonData = JSON.parse(jsonData);
	    	for (key in jsonData) {
	    		if (key === "Subcategory ID" || key === "Added By" || key === "Update Time" || key === "Status" ) {
	    			delete jsonData [key];
	    		}
	    	}
	    	var orderedJsonData = {} ;
	    	orderedJsonData ['Seller Rating From'] = jsonData ['Seller Rating From'];
	    	orderedJsonData ['Seller Rating To'] = jsonData ['Seller Rating To'];
	    	orderedJsonData ['SD Plus Seller Rating From'] = jsonData ['SD Plus Seller Rating From'];
	    	orderedJsonData ['SD Plus Seller Rating To'] = jsonData ['SD Plus Seller Rating To'];
	    	orderedJsonData ['Instant Discount Percent'] = jsonData ['Instant Discount Percent'] ;
	    	orderedJsonData ['Wallet Min Percent'] = jsonData ['Wallet Min Percent'] ;
	    	orderedJsonData ['Wallet Min Absolute'] = jsonData ['Wallet Min Absolute'];
	    	orderedJsonData ['Wallet RoundOff Mod Value'] = jsonData ['Wallet RoundOff Mod Value'];
	    	orderedJsonData ['O2O CM Limit'] = jsonData ['O2O CM Limit'];
	    	orderedJsonData ['Marketing Fee Enabled'] = jsonData ['Marketing Fee Enabled'];
	    	orderedJsonData ['TP Threshold Percent'] = jsonData ['TP Threshold Percent'];
	    	orderedJsonData ['TP Penalty Period (in hrs.)'] = jsonData ['TP Penalty Period (in hrs.)'];
	    	orderedJsonData ['Auto Threshold Percentage'] = jsonData ['Auto Threshold Percentage']
	    	orderedJsonData ['OP Decision Rule (Can\'t beat competition)'] = jsonData ['OP Decision Rule (Can\'t beat competition)'];
	    	orderedJsonData ['Product Rating From'] = jsonData ['Product Rating From'];
	    	orderedJsonData ['Product Rating To'] = jsonData ['Product Rating To'];
	    	orderedJsonData ['SD Plus Product Rating From'] = jsonData ['SD Plus Product Rating From'];
	    	orderedJsonData ['SD Plus Product Rating To'] = jsonData ['SD Plus Product Rating To'];
	        $scope.subcatConfigurationData = orderedJsonData;
	    });
	}
	
	function fetchAutomationSOIDataCtrl ($scope,$http) {
		 $http.get("manageSubcat.action?action=fetchAutomationSOIData")
		    .then(function(response) {
		    	var fieldNotRequired = ["Subcategory_id","status","updateTime","addedBy"];
		    	var jsonData = angular.toJson(response.data);
		    	jsonData = JSON.parse(jsonData);
		    	for (key in jsonData) {
		    		if (key === "Subcategory ID" || key === "Update Time" || key === "Added By" || key === "Status" || key === "Differential Amount" || key === "Zonal Boost Percentage" ) {
		    			delete jsonData[key];
		    		} 
		    	}
		    	if(typeof jsonData != "object"){
		    		jsonData = {};
		    		jsonData ['Shipnear Boost Percent'] = jsonData ['Shipnear Boost Percent']
		    		jsonData ['SD Plus differential Percent'] = jsonData ['SD Plus differential Percent'];
		    	}
		    	$scope.automationSOIData = jsonData;
		    }); 
	}
	
	function fetchSubcategoryConfigurationData () {
		var jsonData ={};
		$( ".configurationData  tr" ).each(function( index ) {
			  jsonData[$(this).find(".key").text()]=$(this).find(".value").val();
			});
		jsonData['OP Decision Rule (Can\'t beat competition)']=$('.mappedCBOption :selected').val();
		for (key in jsonData){
			if (jsonData[key] === "") {
				delete jsonData [key];
			}
		}
		jsonData = JSON.stringify(jsonData);
		return jsonData;
	}
	
	function fetchBigsellerList() {
		var jsonData = {} ;
		var sellerType = $(".SellerType :selected").val() ;
		if (sellerType != "0") { 
		$( "#SellerRightList  option" ).each(function( index ) {
				  jsonData[$(this).val()]=$(this).text();
			});
		}
		jsonData = JSON.stringify(jsonData);
		return jsonData;
	}
	
	function fetchAutomationSOIData () {
		var jsonData ={};
		$( ".automationSOIData  tr" ).each(function( index ) {
			  jsonData[$(this).find(".key").text()]=$(this).find(".value").val();
			});
		for (key in jsonData){
			if (jsonData[key] === "") {
				delete jsonData [key];
			}
		}
		jsonData = JSON.stringify(jsonData);
		return jsonData;
	}
	
	function updateDataCtrl ($scope,$http) {
        var bigSellerUpdateResult = "Success";
        $scope.search = function() {
            var subcatName;
//            subcatName = encodeURIComponent(subcatName);
            var mappedCBOption = $('.mappedCBOption :selected').val();
            if (mappedCBOption === "") {
            	return ;
            }
            var action ;
             if($scope.id == 1){
                 var eventTags = $('#singleFieldTags2');
                    if(eventTags!=null){
                        subcatName = eventTags[0].value;
                    }else{
                        subcatName = "";
                    }
                    if(subcatName == ""){
                        alert("Kindly select a subcat!");
                        return;
                    }
                 action = "manageSubcatUpdate.action";
             }else{
                 action = "manageSubcat.action";
             }
             var subcatConfUpdateResult ;
             var bigSellerUpdateResult ;
             var automationSOIUpdateResult ;
             var jsonData = fetchSubcategoryConfigurationData () ;
             var data = $.param({
                         action: 'updateSubcatConfigurationData',
                         subcategoryConfiguration: jsonData,
                         subcatNameList : subcatName
                          });
             var config = {
                             headers : {
                                        'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                                      }
             }
            $http.post(action,data,config)
                .then(function(response) {
                    subcatConfUpdateResult = response.data ;
                }).then(function(){
                             jsonData = fetchAutomationSOIData ();
                             var data = $.param({
                                             action: 'updateAutomationData',
                                             automationSOIBenifitConfiguration: jsonData,
                                             subcatNameList : subcatName
                                             });
                             var config = {
                                             headers : {
                                                         'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                                                       }
                                 }
                                 $http.post(action,data,config)
                                .then(function(response) {
                                    automationSOIUpdateResult = response.data ;
                                }).then (function(){
                                    if($scope.id == 1){
                                         if (subcatConfUpdateResult === "Success" && automationSOIUpdateResult === "Success") {
                                             
                                             var data = $.param({
                                                     action: 'subcatProcessCall',
                                                     subcatNameList : subcatName
                                                     });
                                             var config = {
                                                     headers : {
                                                                 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                                                               }
                                             }
                                             $http.post(action,data,config);
                                             alert ("Success") ;
                                         
                                        }
                                         else {
                                             alert ("Failed") ;
                                         }   
                                    }else{
                                         if (subcatConfUpdateResult === "Success"  && automationSOIUpdateResult === "Success") {
                                             
                                             var data = $.param({
                                                     action: 'subcatProcessCall'
                                                     });
                                             var config = {
                                                     headers : {
                                                                 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                                                               }
                                             }
                                             $http.post(action,data,config);
                                             alert ("Success") ;
                                         
                                        }
                                         else {
                                             alert ("Failed") ;
                                         }
                                    }
                                   
                                });
                        }); 
    //            }); 
             

             
           
        /*     while (true) {
             if (subcatConfUpdateResult != "undefined" && bigSellerUpdateResult != "undefined" && automationSOIUpdateResult != "undefined") {
             if (subcatConfUpdateResult === "Success" && bigSellerUpdateResult === "Success" && automationSOIUpdateResult === "Success") {
                 alert ("Success") ;
             }
             else {
                 alert ("Failed" + subcatConfUpdateResult + " " + bigSellerUpdateResult + " " + automationSOIUpdateResult) ;
             }
             }
             }*/
             
         }
       
    }
	
	function move (direction , all , type) {
		if (direction) {
			if (all) {
				$("#SellerLeftList option").prop('selected',true);
			}
			$("#SellerLeftList :selected").each(function()
					{	
				$("#SellerRightList").append ($(this)) ;
					});
		}
		else {
			if (all) {
				$("#SellerRightList option").prop('selected',true);
			}
			$("#SellerRightList :selected").each(function()
					{	
				$("#SellerLeftList").append ($(this)) ;
					});
		}

	}
	//COMMENTED TO REMOVE SELLER
	/*function updateDataCtrlCommentedFORSELLER ($scope,$http) {
		$scope.search = function() {
			var subcatName;
//			subcatName = encodeURIComponent(subcatName);	
			var action ;
			 if($scope.id == 1){
				 var eventTags = $('#singleFieldTags2');
					if(eventTags!=null){
						subcatName = eventTags[0].value;
					}else{
						subcatName = "";
					}
					if(subcatName == ""){
						alert("Kindly select a subcat!");
						return;
					}
				 action = "manageSubcatUpdate.action"; 
			 }else{
				 action = "manageSubcat.action"; 
			 }
			 debugger
			 var subcatConfUpdateResult ;
			 var bigSellerUpdateResult ;
			 var automationSOIUpdateResult ;
			 var jsonData = fetchSubcategoryConfigurationData () ;
			 var data = $.param({
				 	    action: 'updateSubcatConfigurationData',
				 	    subcategoryConfiguration: jsonData,
				 	    subcatNameList : subcatName
				 	     });
			 var config = {
				 		    headers : {
				 		               'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
						              }
			 }
			$http.post(action,data,config)
			    .then(function(response) {
			    	subcatConfUpdateResult = response.data ;
			    }).then(function(){
			    	debugger
					 jsonData = fetchBigsellerList();
					 
					 var data = $.param({
						 			      action: 'updateBigSellerData',
						 			      bigSellerList: jsonData,
									 	    subcatNameList : subcatName
						 			     });
					 var config = {
						 			headers : {
						 				         'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
						 				      }
						}
						$http.post(action, data , config)
					    .then(function(response) {
					    	bigSellerUpdateResult = response.data ;
					    }).then(function(){
					    	 jsonData = fetchAutomationSOIData ();
					    	 var data = $.param({
					    		 			action: 'updateAutomationData',
					    		 			automationSOIBenifitConfiguration: jsonData,
									 	    subcatNameList : subcatName
					    		 			});
					    	 var config = {
					    		 			headers : {
					    		 						'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
					    		 					  }
					    		 }
					    	 	$http.post(action,data,config)
							    .then(function(response) {
							    	automationSOIUpdateResult = response.data ;
							    }).then (function(){
							    	if($scope.id == 1){
							    		 if (subcatConfUpdateResult === "Success" && automationSOIUpdateResult === "Success") {
								    		 
								    		 var data = $.param({
							    		 			action: 'subcatProcessCall',
											 	    subcatNameList : subcatName
							    		 			});
								    		 var config = {
							    		 			headers : {
							    		 						'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
							    		 					  }
								    		 }
								    		 $http.post(action,data,config);
								    		 alert ("Success") ;
										 
								    	}
										 else {
											 alert ("Failed") ;
										 }	
							    	}else{
							    		 if (subcatConfUpdateResult === "Success" && bigSellerUpdateResult === "Success" && automationSOIUpdateResult === "Success") {
								    		 
								    		 var data = $.param({
							    		 			action: 'subcatProcessCall'
							    		 			});
								    		 var config = {
							    		 			headers : {
							    		 						'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
							    		 					  }
								    		 }
								    		 $http.post(action,data,config);
								    		 alert ("Success") ;
										 
								    	}
										 else {
											 alert ("Failed") ;
										 }
							    	}
							    	
							    });
					    });  
			    });  
			 

			 
			
			 while (true) {
			 if (subcatConfUpdateResult != "undefined" && bigSellerUpdateResult != "undefined" && automationSOIUpdateResult != "undefined") {
			 if (subcatConfUpdateResult === "Success" && bigSellerUpdateResult === "Success" && automationSOIUpdateResult === "Success") {
				 alert ("Success") ;
			 }
			 else {
				 alert ("Failed" + subcatConfUpdateResult + " " + bigSellerUpdateResult + " " + automationSOIUpdateResult) ;
			 }
			 }
			 }
			 
		 }
		
	}*/
	

