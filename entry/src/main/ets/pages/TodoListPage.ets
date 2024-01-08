import TodoListItem from '../view/TodoListItem';
import TodoListDataModel from '../viewmodel/TodoListDataModel';
/**
 * Created on 2024/1/4.
 * @author wangyongbin
 * @discription:待办列表
**/

@Entry
@Component
struct TodoListPage {
  @State message: string = 'Hello World'
  @State isComplete: boolean = false
  private todoTasks: Array<string> = [];

  //当页面即将显示到屏幕上之前调用，常用于初始化数据，加载资源，执行动画等。
  //初始化列表数据
  aboutToAppear() {
    this.todoTasks = TodoListDataModel.getData();
  }

  build() {
    Column({ space: 16 }) {
      Stack() {
        Text($r('app.string.todo_list'))
          .fontColor(Color.Blue)
          .fontSize($r('app.float.title_font_size'))
          .fontWeight(FontWeight.Bold)
          .lineHeight($r('app.float.title_font_height'))
          .width('50%')
          .margin({
            top: $r('app.float.title_margin_top'),
            bottom: $r('app.float.title_margin_bottom') })
          .textAlign(TextAlign.Center)
          .align(Alignment.Center)
        Row() {
          this.checkbox(this.isComplete ? '全选' : '全不选')
          Button(this.isComplete ? $r('app.string.check_all') : $r('app.string.check_call_cancel'))
            .type(ButtonType.Normal)
            .borderRadius(3)
            .fontSize($r('app.float.main_text_size'))
        }
        .width('100%')
        .onClick(() => {
          this.isComplete = !this.isComplete
        })
        .align(Alignment.End)
      }.width('100%')

      ForEach(this.todoTasks, (item: string, index: number) => {
        TodoListItem({ content: item, isComplete: false })
      }, (item: string, index: number) => {
        return JSON.stringify(item);
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }

  @Builder checkbox(name?: string) {
    Checkbox({ name: name })
      .select(this.isComplete)
      .onChange((value: boolean) => {
        this.isComplete = value;
        console.info('Checkbox2 change is  ' + value + "   isComplete： " + this.isComplete)
      })
  }
}