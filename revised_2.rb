# global
OPTION = ['グー','チョキ','パー']
GAME_OPTION = ['上','下','左','右']

# じゃんけんの勝敗をジャッジする
def judge(me, computer)
  if me == 'グー'
    if computer == 'グー'
      return "continue"
    elsif computer == 'チョキ'
      return "win"
    elsif computer == "パー"
      return "lose"
    end
  elsif me == 'チョキ'
    if computer == 'チョキ'
      return "continue"
    elsif computer == 'パー'
      return "win"
    elsif computer == "グー"
      return "lose"
    end
  elsif me == 'パー'
    if computer == 'パー'
      return "continue"
    elsif computer == 'グー'
      return "win"
    elsif computer == "チョキ"
      return "lose"
    end
  end
end

# あっち向いてホイの勝敗をジャッジする
def game_judge(me, computer)
  if me == '上'
    if computer == '上'
      return "win"
    else
      return "continue"
    end
  end
  if me == '下'
    if computer == '下'
      return "win"
    else
      return "continue"
    end
  end
  if me == '右'
    if computer == '右'
      return "win"
    else
      return "continue"
    end
  end
  if me == '左'
    if computer == '左'
      return "win"
    else
      return "continue"
    end
  end
end

# じゃんけんの結果を格納するグローバル変数
result = nil

loop do
  ## じゃんけん処理 start

  # コンピュータのじゃんけんの手
  computer_jyanken = "#{rand(3)}".to_i

  if result != "continue"

    puts ''
    puts 'じゃんけん...'
    puts '0(グー)1(チョキ)2(パー)3(戦わない)'
    pon = gets.to_i

    # 戦わない場合は処理を終了する
    break if pon == 3

    puts 'ホイ!'
    puts '---------------'
    puts "あなた:#{OPTION[pon]}を出しました。"
    puts "相手:#{OPTION[computer_jyanken]}を出しました。"
    puts '---------------'
    puts ''

  else
    puts ''
    puts 'アイコで...'
    puts '0(グー)1(チョキ)2(パー)3(戦わない)'
    pon = gets.to_i

    # 戦わない場合は処理を終了する
    break if pon == 3

    puts 'ショッ!'
    puts '---------------'
    puts "あなた:#{OPTION[pon]}を出しました。"
    puts "相手:#{OPTION[computer_jyanken]}を出しました。"
    puts '---------------'
    puts ''
  end

  result = judge(OPTION[pon], OPTION[computer_jyanken])

  # じゃんけんの結果がでたら、じゃんけん終了
  if result == "continue"
    next
  end

  ## じゃんけん処理 end

  ## あっち向いてほい処理 start
  puts 'あっちむいて〜'
  puts '0(上),1(下),2(左),3(右)'
  hoi = gets.to_i
  computer = "#{rand(4)}".to_i

  puts ''
  puts '---------------'
  puts "あなた:#{GAME_OPTION[hoi]}"
  puts "相手:#{GAME_OPTION[computer]}"
  puts '---------------'
  puts ''

  game_result = game_judge(GAME_OPTION[hoi], GAME_OPTION[computer])

  # 勝負の結果が出たら終了
  if game_result == "continue"
    next
  elsif (result == "win") && (game_result == "win")
    puts "あなたの勝ちです！"
    break
  elsif (result == "lose") && (game_result == "win")
    puts "あなたの負けです！"
    break
  end
end

puts 'ゲーム終了'
