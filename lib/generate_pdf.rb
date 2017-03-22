require 'prawn'
module GeneratePdf
	PDF_OPTIONS_PASTA_FOLHA = {
		# Escolhe o Page size como uma folha A4
		:page_size   => "A4",
		# Define o formato do layout como portrait (poderia ser landscape)
		:page_layout => :portrait,
		# Define a margem do documento
		:margin      => [40, 75]
	}
	#schedule, appointment, name
	def self.attend_pasta_folha attend
		Prawn::Document.new(PDF_OPTIONS_PASTA_FOLHA) do |pdf|
			# Define a cor do traçado
			pdf.fill_color "333333"
			pdf.font "Helvetica"
			pdf.image "public/logo-export.png", :scale => 0.06
			pdf.move_down 20
			pdf.text "Nome: <b>#{attend.patient.name}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "Gênero: <b>#{attend.patient.gender}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "Nascimento: <b>#{attend.patient.birth_date.strftime("%d/%m/%Y")}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "Idade: <b>#{attend.age} anos</b>", inline_format: true
			pdf.move_down 10
			pdf.text "CPF: <b>#{attend.patient.cpf}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "RG: <b>#{attend.patient.rg}</b>", inline_format: true			
			pdf.move_down 10
			pdf.text "Email: <b>#{attend.patient.email}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "Endereço: <b>#{attend.patient.address}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "CEP: <b>#{attend.patient.cep}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "Cidade/Estado: <b>#{attend.patient.city}, #{attend.patient.province.acronym}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "Fone: <b>#{attend.patient.phone}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "Fone: <b>#{attend.patient.phone2}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "Profissão: <b>#{attend.patient.occupation}</b>", inline_format: true			
			pdf.move_down 10
			pdf.text "Nome da mãe: <b>#{attend.patient.mothers_name}</b>", inline_format: true
			pdf.move_down 10
			pdf.text "Nome do pai: <b>#{attend.patient.fathers_name}</b>", inline_format: true
			# Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
			pdf.text "<link href='http://www.radiodontica.com.br'> <color rgb='5ca3e6'>www.raiodontica.com.br</color></link>", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
			# Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
			pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
			# Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
			pdf.render_file('public/attend.pdf')
		end
	end

	def self.attend_pasta_etiqueta schedule, appointment, name
		# Apenas uma string aleatório para termos um corpo de texto pro contrato
		lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum nulla id dignissim iaculis. Vestibulum a egestas elit, vitae feugiat velit. Vestibulum consectetur non neque sit amet tristique. Maecenas sollicitudin enim elit, in auctor ligula facilisis sit amet. Fusce imperdiet risus sed bibendum hendrerit. Sed vitae ante sit amet sapien aliquam consequat. Duis sed magna dignissim, lobortis tortor nec, suscipit velit. Nulla sit amet fringilla nisl. Integer tempor mauris vitae augue lobortis posuere. Ut quis tellus purus. Nullam dolor mauris, egestas varius ligula non, cursus faucibus orci sectetur non neque sit amet tristique. Maecenas sollicitudin enim elit, in auctor ligula facilisis sit amet. Fusce imperdiet risus sed bibendum hendrerit. Sed vitae ante sit amet sapien aliquam consequat."
		
		Prawn::Document.new(PDF_OPTIONS) do |pdf|
			# Define a cor do traçado
			pdf.fill_color "666666"
			# Cria um texto com tamanho 30 PDF Points, bold alinha no centro
			pdf.text "Etiqueta", :size => 32, :style => :bold, :align => :center
			# Move 80 PDF points para baixo o cursor
			pdf.move_down 80
			# Escreve o texto do contrato com o tamanho de 14 PDF points, com o alinhamento justify
			pdf.text "#{lorem_ipsum}", :size => 12, :align => :justify, :inline_format => true
			# Move mais 30 PDF points para baixo o cursor
			pdf.move_down 30
			# Escreve o texto com os detalhess que o usuário entrou
			pdf.text "#{schedule}", :size => 12, :align => :justify, :inline_format => true
			# Move mais 30 PDF points para baixo o cursor
			pdf.move_down 10
			# Adiciona o nome com 12 PDF points, justify e com o formato inline (Observe que o <b></b> funciona para deixar em negrito)
			pdf.text "Com o cliente: <b>#{name}</b> por R$#{appointment}", :size => 12, :align => :justify, :inline_format => true
			# Muda de font para Helvetica
			pdf.font "Helvetica"
			# Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
			pdf.text "Link Para o Manul do Prawn<link href='http://prawnpdf.org/manual.pdf'> <color rgb='5ca3e6'>clicável</color></link>", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
			# Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
			pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
			# Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
			pdf.render_file('public/attend.pdf')
		end
	end
end


			##pdf.text "#{lorem_ipsum}", :size => 12, :align => :justify, :inline_format => true
			# Move mais 30 PDF points para baixo o cursor
			##pdf.move_down 30
			# Escreve o texto com os detalhess que o usuário entrou
			##pdf.text "#{attend.schedule}", :size => 12, :align => :justify, :inline_format => true
			# Move mais 30 PDF points para baixo o cursor
			##pdf.move_down 10
			# Adiciona o nome com 12 PDF points, justify e com o formato inline (Observe que o <b></b> funciona para deixar em negrito)
			##pdf.text "Com o cliente: <b>#{attend.patient.name}</b> por R$#{attend.appointment}", :size => 12, :align => :justify, :inline_format => true
			# Muda de font para Helvetica
			##pdf.text "Single line on 20 using the :size option.", :size => 20
			# Cria um texto com tamanho 30 PDF Points, bold alinha no centro
			##pdf.text "Nome: #{name}", :size => 32, :style => :bold, :align => :center			