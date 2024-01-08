/**
 * Created on 2024/1/5.
 * @author wangyongbin
 * @discription:
**/
import Logger from '../utils/Logger';

@Component
export default struct TodoListItem {
  private content?: string;
  @Prop isComplete: boolean;

  build() {
    Row() {
      this.itemImage({ iconres: this.isComplete ? $r('app.media.ic_ok') : $r('app.media.ic_default') });
      this.itemText({ content: this.content });
    }
    .borderRadius(20)
    .backgroundColor($r('app.color.item_background'))
    .width('90%')
    .height($r('app.float.list_item_height'))
    .onClick(() => {
      this.isComplete = !this.isComplete;
      Logger.info("aaa", "  " + this.isComplete)
    })
  }

  @Builder itemText($$: { content?: string }) {
    Text($$.content)
      .fontSize($r('app.float.item_font_size'))
      .fontWeight(500)
      .padding({ left: 5 })
      .opacity(this.isComplete ? 0.4 : 1.0) //透明度
      .textAlign(TextAlign.Start)
      .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
  }

  //$$:引用的传递，值传递会新建一个变量副本。
  @Builder itemImage($$: { iconres?: Resource }) {
    Image($$.iconres)
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }
}