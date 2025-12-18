puts "Informe uma competência"
cmpt = gets.chomp().to_i

cmpt_ini = 202511
cmpt_fim = 202611

if cmpt.between?(cmpt_ini, cmpt_fim)
  puts "A competência está no meio"
end