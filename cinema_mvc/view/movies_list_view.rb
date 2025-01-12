require_relative '../controller/movies_list_controller.rb'
require 'fox16'
include Fox

class MoviesListView < FXVerticalFrame

  attr_accessor :current_page, :items_per_page

  def initialize(parent)
    super(parent, LAYOUT_FILL_X | LAYOUT_FILL_Y, padding: 10)
    @current_page = 1
    @items_per_page = 11
    @total_pages = 0
    @controller = MoviesListController.new(self)

    main_frame = FXHorizontalFrame.new(self, LAYOUT_FILL_X | LAYOUT_FILL_Y)

    table_frame = FXVerticalFrame.new(main_frame, LAYOUT_FILL_X | LAYOUT_FILL_Y, padding: 10)
    set_table_parameters(table_frame)

    control_frame = FXVerticalFrame.new(main_frame, LAYOUT_FIX_WIDTH, width: 180, padding: 10)
    set_control_parameters(control_frame)

    refresh_data
  end

  def set_table_parameters(parent)
    @table = FXTable.new(parent, opts: LAYOUT_FILL_X | LAYOUT_FILL_Y | TABLE_READONLY | TABLE_COL_SIZABLE)
    @table.setTableSize(@items_per_page, 4)
    @table.setColumnWidth(0, 30)
    (1...4).each { |col| @table.setColumnWidth(col, 180) }
    @table.rowHeaderWidth = 0
    @table.columnHeaderHeight = 0
    @table.connect(SEL_COMMAND) do |_, _, pos|
      if pos.col == 0 && pos.row != 0
        @table.selectRow(pos.row)
      end
      update_buttons_state
    end

    nav_frame = FXHorizontalFrame.new(parent, opts: LAYOUT_FILL_X)
    @prev_button = FXButton.new(nav_frame, "<", opts: BUTTON_NORMAL | LAYOUT_LEFT)
    @next_button = FXButton.new(nav_frame, ">", opts: BUTTON_NORMAL | LAYOUT_RIGHT)
    @page_label = FXLabel.new(nav_frame, "Страница 1", opts: LAYOUT_CENTER_X)
    @prev_button.connect(SEL_COMMAND) { change_page(-1) }
    @next_button.connect(SEL_COMMAND) { change_page(1) }
  end

  def set_control_parameters(parent)
    FXLabel.new(parent, "ОБЛАСТЬ УПРАВЛЕНИЯ", opts: LAYOUT_FILL_X)

    add_button = FXButton.new(parent, "Добавить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    add_button.connect(SEL_COMMAND) { add_movie }

    @delete_button = FXButton.new(parent, "Удалить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    @delete_button.connect(SEL_COMMAND) { delete_movies }

    @edit_button = FXButton.new(parent, "Изменить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    @edit_button.connect(SEL_COMMAND) { edit_movie }

    refresh_button = FXButton.new(parent, "Обновить", opts: BUTTON_NORMAL | LAYOUT_FILL_X)
    refresh_button.connect(SEL_COMMAND) { refresh_data }

    @table.connect(SEL_CHANGED) { update_buttons_state }

    update_buttons_state
  end

  def update_buttons_state
    selected_rows = (0...@table.numRows).select { |row| @table.rowSelected?(row) }
    @delete_button.enabled = !selected_rows.empty?
    @edit_button.enabled = (selected_rows.size == 1)
  end

  def change_page(offset)
    new_page = @current_page + offset
    return if new_page < 1 || new_page > @total_pages

    @current_page = new_page
    @controller.refresh_data
  end

  def set_table_data(input_data_table)
    clear_table
    (0...input_data_table.row_count).each do |row|
      (0...input_data_table.column_count).each do |col|
        @table.setItemText(row, col, input_data_table.get_element(row, col).to_s)
      end
    end
  end

  def set_table_params(column_names, entries_count)
    @table.setTableSize(entries_count > 0 ? entries_count + 1 : 1, column_names.size)
    column_names.each_with_index do |name, index|
      @table.setItemText(0, index, name)
    end
    @total_pages = entries_count > 0 ? (entries_count / @items_per_page.to_f).ceil : 0
    @page_label.text = @total_pages > 0 ? "Page #{@current_page} of #{@total_pages}" : "No data"
  end

  def refresh_data
    @current_page = 1
    @controller.refresh_data
  end

  private

  def clear_table
    (0...@table.numRows).each do |row|
      (0...@table.numColumns).each do |col|
        @table.setItemText(row, col, "")
      end
    end
  end

  def add_movie
    @controller.create
  end

  def edit_movie
    selected_row = (0...@table.numRows).find { |row| @table.rowSelected?(row) }
    @controller.edit(selected_row) if selected_row
  end

  def delete_movies
    selected_rows = (0...@table.numRows).select { |row| @table.rowSelected?(row) }
    @controller.delete(selected_rows)
  end

end