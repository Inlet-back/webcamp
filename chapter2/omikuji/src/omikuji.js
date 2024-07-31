let username;
let userresult;

//名前の入力
username = prompt("お名前を教えて下さい。");

//入力した名前をhtmlに反映
if (username == "") {
  document.getElementById("name").innerHTML = "名無し";
} else {
  document.getElementById("name").innerHTML = username;
}

//おみくじ用にランダムな数を生成
let rand = Math.floor(Math.random() * 5);

//結果
if (rand == 0) {
  userresult = "大吉";
}
if (rand == 1) {
  userresult = "中吉";
}
if (rand == 2) {
  userresult = "小吉";
}
if (rand == 3) {
  userresult = "吉";
}
if (rand == 4) {
  userresult = "凶";
}

//結果をhtmlに反映
document.getElementById("result").innerHTML = userresult;
