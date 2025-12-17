require "test_helper"

class DebitosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @debito = debitos(:one)
  end

  test "should get index" do
    get debitos_url
    assert_response :success
  end

  test "should get new" do
    get new_debito_url
    assert_response :success
  end

  test "should create debito" do
    assert_difference("Debito.count") do
      post debitos_url, params: { debito: { contrato_id_id: @debito.contrato_id_id, data_vencimento: @debito.data_vencimento, descricao: @debito.descricao, nome_debito: @debito.nome_debito, valor_debito: @debito.valor_debito } }
    end

    assert_redirected_to debito_url(Debito.last)
  end

  test "should show debito" do
    get debito_url(@debito)
    assert_response :success
  end

  test "should get edit" do
    get edit_debito_url(@debito)
    assert_response :success
  end

  test "should update debito" do
    patch debito_url(@debito), params: { debito: { contrato_id_id: @debito.contrato_id_id, data_vencimento: @debito.data_vencimento, descricao: @debito.descricao, nome_debito: @debito.nome_debito, valor_debito: @debito.valor_debito } }
    assert_redirected_to debito_url(@debito)
  end

  test "should destroy debito" do
    assert_difference("Debito.count", -1) do
      delete debito_url(@debito)
    end

    assert_redirected_to debitos_url
  end
end
