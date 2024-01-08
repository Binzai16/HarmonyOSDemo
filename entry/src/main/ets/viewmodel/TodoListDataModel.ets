/**
 * Created on 2024/1/5.
 * @author wangyongbin
 * @discription:待办列表获取数据
**/
import CommonConstants from '../common/CommonConstants'

export class TodoListDataModel {
  private tasks: Array<string> = CommonConstants.TODO_LIST_DATA;

  getData(): Array<string> {
    return this.tasks;
  }
}
//js写法，默认一个新的 TodoListDataModel实例
export default new TodoListDataModel();