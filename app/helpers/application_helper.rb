module ApplicationHelper
  def to_boolean(integer)
    @to_boolean = !(integer=="0")
  end
  def my_project(project)
    @my_project = project.usuario_id == current_user.id
  end
  def success_format(id)
    @success_format = "rounded blue "+id.to_s()
  end
  def error_format(id)
    @error_format = "rounded red "+id.to_s()
  end
  def notice_format(id)
    @notice_format = "green "+id.to_s()
  end

  def danger_format(id)
    @danger_format = "red "+id.to_s()
  end
end
