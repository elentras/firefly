# encoding: UTF-8

module ApplicationHelper
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
