import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hello"
export default class extends Controller {
  connect() {
  }
  // ターゲット（操作対象のDOM）のプロパティを作成
  static targets = [ "name" ]

  // アクション（イベントに紐づく処理）を定義する
  greet() {
    // xxxxTargetでターゲットとなるDOMにアクセスできる
    // ターゲット（今回であれば<input>）のvalueをログ吐き
    console.log(this.nameTarget.value)
  }
}
