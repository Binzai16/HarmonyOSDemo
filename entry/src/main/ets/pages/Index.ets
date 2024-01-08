import router from '@ohos.router';
import CommonConstants from '../common/CommonConstants';
import Logger from '../utils/Logger';

//const表示常量
const TAG = 'IndexPage';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Button() {
          Text($r('app.string.goto_todo_list'))
            .fontSize($r('app.float.main_text_size'))
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
        }.onClick(() => {
          router.pushUrl({
            url: CommonConstants.TODO_LIST_PAGE_UTL,
            params: null
          }).catch((error: Error) => {
            Logger.info(TAG, 'IndexPage push error' + JSON.stringify(error));
          });
        }).borderRadius(2)
        .width(180)
        .height(50)
      }
      .width('100%')
    }
    .height('100%')
  }
}