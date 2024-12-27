require_relative '../view/student_list_view.rb'
require_relative '../model/strategy_pattern/student_list_base.rb'

class StudentsListController
  def initialize(view)
    @view = view
    @students_list = StudentsListBase.new('../resources/data/students.json', StorageStrategyJSON.new)
    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
  end

  def refresh_data
    @students_list.get_k_n_student_short_list(@view.current_page, @view.items_per_page - 1, @data_list)
    @data_list.count = @students_list.get_student_short_count
    @data_list.notify
  end

  def sort_table_by_column(data, sort_order, col_idx)
    # headers = (0...data.column_count).map {|col_idx| data.get_element(0, col_idx)}
    # rows = (1...data.row_count).map do |row_idx|
    #     (0...data.column_count).map {|column_idx| data.get_element(row_idx, column_idx)}
    # end
    # sort_order ||= {}
    # sort_order[col_idx] = !sort_order.fetch(col_idx, false)
    # sorted_rows = rows.sort_by do |row| 
    #     value = row[col_idx]
    #     value.nil? ? "\xFF" * 1000 : value
    # end
    # sorted_rows.reverse! unless sort_order[col_idx]
    # return DataTable.new([headers] + sorted_rows), sort_order
  end

  def create
      puts "Создание записи"
  end

  def update(number)
      return if number.nil?
      puts "Изменение строки с номером: #{number}"
  end

  def delete(number)
      return if number.nil?
      puts "Удаление строк с номерами #{number}"
  end

  private

  attr_accessor :view, :students_list, :data_list
end