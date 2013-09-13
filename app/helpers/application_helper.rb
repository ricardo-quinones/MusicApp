module ApplicationHelper
  def adds_s(name)
    "#{name}'#{name[-1] == "s" ? "" : "s"}"
  end
end
