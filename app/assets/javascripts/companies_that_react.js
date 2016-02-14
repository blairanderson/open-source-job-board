var $list;
$(function(){
  // find the container
  $list = document.getElementById('show-companies');
  // make sure the container exists before fetching the data
  if ($list) {
    // fetch the data
    var fetching = $.getJSON("https://rawgit.com/stefanRitter/react.careers/master/src/companies.json")
    // set the callback function
    fetching.done(showCompanies)
  }

})

function showCompanies(companiesObject){
  Object.keys(companiesObject).forEach(function(name){
    var company = companiesObject[name];

    var $anchor = $("<a>", {"class": "company", "href": company.url, 'target': "_blank"});

    var logo = "https://cdn.rawgit.com/stefanRitter/react.careers/master/src/img"+company.logo;
    var $img = $("<img>", {src: logo, alt: name+" logo"});
    $anchor.append($img)

    var $span = $("<span>", {html: "Search for React.js jobs at<br>"+name});
    $anchor.append($span)

    $($list).append($anchor)
  })
}
