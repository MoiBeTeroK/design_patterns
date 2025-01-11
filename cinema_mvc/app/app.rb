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

  def create_sections
    tabs = FXTabBook.new(self, opts: LAYOUT_FILL)
    
    ['Фильмы', 'Сеансы', 'Кинозалы'].each do |title|
      tab_item = FXTabItem.new(tabs, title, opts: JUSTIFY_CENTER_X)
      FXVerticalFrame.new(tabs, opts: LAYOUT_FILL)
    end
  end
end 