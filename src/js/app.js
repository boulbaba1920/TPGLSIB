App=
{web3Provider:null,
  contracts:{},
  account:'0x0',

  init:function()
  {returnApp.initWeb3();
  },

  initWeb3:function(){
    if(typeofweb3!=='undefined'){
    //Ifaweb3instanceisalreadyprovidedbyMetaMask.
    App.web3Provider=web3.currentProvider;
    web3 = newWeb3(web3.currentProvider);
  }
    else{
      //Specifydefaultinstanceifnoweb3instanceprovided
      App.web3Provider=newWeb3.providers.HttpProvider('http://localhost:7545');
      web3 = newWeb3(App.web3Provider);
    }
    return
    App.initContract();
  },

  initContract:function(){
    $.getJSON("Election.json",function(election){
    //Instantiateanewtrufflecontractfromtheartifact
    App.contracts.Election=TruffleContract(election);
    //Connectprovidertointeractwithcontract
    App.contracts.Election.setProvider(App.web3Provider);
    returnApp.render();
  });},
  render:function(){
    varelectionInstance;
    varloader=$("#loader");
    varcontent=$("#content");
    loader.show();
    content.hide();
  //Loadaccountdata
  web3.eth.getCoinbase(function(err,account){
    if(err===null)
    {App.account=account;
      $("#accountAddress").html("YourAccount:"+account); 
   }
  });
    //Load contract data
    App.contracts.Election.deployed().then(function(instance){
      electionInstance=instance;
      return electionInstance.candidatesCount();
    }).then(function(candidatesCount){
      var
      candidatesResults=$("#candidatesResults");
      candidatesResults.empty();
      for(vari=1;i<=candidatesCount;i++)
      {
        electionInstance.candidates(i).then(function(candidate){
          var id=candidate[0];
          var name=candidate[1];
          varvoteCount=candidate[2];
          //RendercandidateResult
          var
          candidateTemplate="<tr><th>" + id + "</th><td>" + name + "</td><td>" + voteCount + "</td></tr>"
          candidatesResults.append(candidateTemplate);
        });
      }
      loader.hide();
      content.show();
    }).catch(function(error){
      console.warn(error);
    });
  }
};
$(function(){
  $(window).load(function(){
    App.init();
  });
});