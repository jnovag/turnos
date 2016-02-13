require 'test_helper'

class EstadisticasTest < ActionMailer::TestCase
  test "reporte" do
    mail = Estadisticas.reporte
    assert_equal "Reporte", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
