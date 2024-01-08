/**
 * Created on 2024/1/4.
* @author wangyongbin
 * @discription:排行榜
**/


@Entry
@Component
struct RankPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}