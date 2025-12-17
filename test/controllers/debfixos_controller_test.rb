require "test_helper"

class DebfixosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @debfixo = debfixos(:one)
  end

  test "should get index" do
    get debfixos_url
    assert_response :success
  end

  test "should get new" do
    get new_debfixo_url
    assert_response :success
  end

  test "should create debfixo" do
    assert_difference("Debfixo.count") do
      post debfixos_url, params: { debfixo: { cmpt_fim: @debfixo.cmpt_fim, cmpt_ini: @debfixo.cmpt_ini, nome_debfx: @debfixo.nome_debfx, quitado: @debfixo.quitado, valor_debfx: @debfixo.valor_debfx } }
    end

    assert_redirected_to debfixo_url(Debfixo.last)
  end

  test "should show debfixo" do
    get debfixo_url(@debfixo)
    assert_response :success
  end

  test "should get edit" do
    get edit_debfixo_url(@debfixo)
    assert_response :success
  end

  test "should update debfixo" do
    patch debfixo_url(@debfixo), params: { debfixo: { cmpt_fim: @debfixo.cmpt_fim, cmpt_ini: @debfixo.cmpt_ini, nome_debfx: @debfixo.nome_debfx, quitado: @debfixo.quitado, valor_debfx: @debfixo.valor_debfx } }
    assert_redirected_to debfixo_url(@debfixo)
  end

  test "should destroy debfixo" do
    assert_difference("Debfixo.count", -1) do
      delete debfixo_url(@debfixo)
    end

    assert_redirected_to debfixos_url
  end
end
