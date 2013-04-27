# encoding: UTF-8

module ApplicationHelper
  def tab_to(title, path, controllers, actions)
    current = !!(controllers.include?(controller.controller_name) and actions.include?(controller.action_name) )
    active = current ? 'active' : '' 
    content_tag :li, :class => active do
      link_to title, path
    end
  end
  
  def link_to_submit(*args, &block)
    link_to_function (block_given? ? capture(&block) : args[0]), "$(this).closest('form').submit()", args.extract_options!
  end
  
  def link_to_controls(torrent)
    case torrent.status
    when "start"
      name = "Pause"
      action = :stop
      btn = "btn-warning"
    when "finished"
      # name = "Vérifier"
      # action = :verify
      # btn = "btn-info"
    when "stop"
      name = "Démarrer"
      action = :start
      btn = "btn-success"
    end

    datas = { action: action, id: torrent.id.to_s }
    content_tag :div, {class: "btn #{btn} torrent_controls", data: datas} do
      name
    end unless name.blank?
  end
end
