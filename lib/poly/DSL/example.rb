class Computer
  #метод initialize это конструктор
  def initialize &block #&block означает что методу передается блок кода
    instance_eval &block #вызываем волшебный метод instance_eval и передаем ему блок
  end

  #тут я объявил методы вместо аттрибутов, чтобы вместо cpu= 2.ghz писать cpu 2.ghz
  def cpu val
    @cpu_clock = val
  end

  def ram val
    @ram_size = val
  end

  def disk val
    @disk_size = val
  end

  #в установке значения теперь нет нужды, так как есть методы cpu и тд
  #по этому я вызываю attr вместо attr_accessor, он не будет генерировать метод для установки значения
  #но есть небольшое ограничение, т.к. в динамических языках нельзя перегружать методы
  #(a attr_accessor по настоящему создает методы)
  #то для аттрибутов нужно выбрать другие имена
  attr :cpu_clock
  attr :ram_size
  attr :disk_size
end