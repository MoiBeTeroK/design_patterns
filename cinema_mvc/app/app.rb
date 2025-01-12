require_relative '../view/movies_list_view.rb'
require 'fox16'
include Fox

class App < FXMainWindow
  def initialize(app)
    super(app, 'Кинотеатр', width: 1000, height: 500)
    self.create_sections
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  private

  attr_accessor :movies_list_view

  def on_tab_changed(index)
    if index == 0
      self.movies_list_view.refresh_data
    end
  end

  def create_sections
    tabs = FXTabBook.new(self, opts: LAYOUT_FILL)
    
    ['Фильмы', 'Сеансы', 'Кинозалы'].each do |title|
      tab_item = FXTabItem.new(tabs, title, opts: JUSTIFY_CENTER_X)
      content_frame = FXVerticalFrame.new(tabs, opts: LAYOUT_FILL | FRAME_THICK | FRAME_RAISED)
      
      case title
      when 'Фильмы'
        @movies_list_view = MoviesListView.new(content_frame)
      when 'Сеансы'
        # что-то
      when 'Кинозалы'
        # что-то
      end
    end
  
    tabs.connect(SEL_COMMAND) do |sender, _selector, index|
      on_tab_changed(index)
    end
  end
end 