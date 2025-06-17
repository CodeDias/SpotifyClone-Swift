//
//  ViewController.swift
//  spotify
//
//  Created by COTEMIG on 03/06/25.
//

import UIKit

// MARK: - botaonav Class
// Uma subclasse de UIButton para estilização customizada de botões.
class botaonav: UIButton {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    // MARK: - Setup

    private func setupButton() {
        // Estilização básica do botão
        backgroundColor = .systemBlue // Cor de fundo padrão
        setTitleColor(.white, for: .normal) // Cor do texto
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold) // Fonte do texto

        // Configurações de borda e arredondamento
        layer.cornerRadius = 13 // Raio de arredondamento
        layer.masksToBounds = true // Essencial para cortar o conteúdo ao raio
        layer.borderWidth = 1 // Largura da borda
        layer.borderColor = UIColor.black.cgColor // Cor da borda
    }

    // MARK: - Configuration
    
    // Método para configurar o título do botão
    func configure(withTitle title: String) {
        setTitle(title, for: .normal)
    }
}

// MARK: - ImagemFooter Class
// Uma subclasse de UIImageView para estilização customizada de imagens de rodapé.
class ImagemFooter: UIImageView {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImage()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupImage()
    }

    // MARK: - Setup

    private func setupImage() {
        // Configura o corner radius para a imagem
        layer.cornerRadius = 7 // Raio de arredondamento
        layer.masksToBounds = true // Essencial para cortar o conteúdo ao raio
    }

    // MARK: - Configuration

    // Método para configurar a imagem
    func configure(withImage image: UIImage?) {
        self.image = image
    }
}

// MARK: - imgcard Class
// Uma nova subclasse de UIImageView para estilização de imagens como "cards".
class imgcard: UIImageView {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageCard()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupImageCard()
    }

    // MARK: - Setup

    private func setupImageCard() {
        // Configura o corner radius para a imagem do card
        layer.cornerRadius = 10 // Exemplo: 10 pontos de arredondamento
        layer.masksToBounds = true // Essencial para cortar o conteúdo ao raio
        
    }

    // MARK: - Configuration

    // Método para configurar a imagem
    func configure(withImage image: UIImage?) {1
        self.image = image
    }
}

// MARK: - MyViewController Class
// O principal controlador de visualização do seu aplicativo.
class MyViewController: UIViewController {

    // MARK: - IBOutlets

    // Conecte esses outlets do Storyboard arrastando do círculo para os elementos correspondentes.
    @IBOutlet weak var myProgressView: UIProgressView! // Este é o OUTLET, a instância vem do Storyboard.
    @IBOutlet weak var meuBotaoDoStoryboard: botaonav!
    @IBOutlet weak var minhaImagemDoStoryboard: ImagemFooter!
    @IBOutlet weak var minhaNovaImagemCard: imgcard! // Conecte essa imagem à classe 'imgcard' no Storyboard!


    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Define a cor de fundo do controlador de visualização
        view.backgroundColor = .systemGray5

        // MARK: - Configurando botaonav Programaticamente

        let meuBotaoProgramatico = botaonav(frame: .zero)
        meuBotaoProgramatico.configure(withTitle: "Botão do Código")
        meuBotaoProgramatico.translatesAutoresizingMaskIntoConstraints = false // Essencial para Auto Layout
        meuBotaoProgramatico.addTarget(self, action: #selector(botaoProgramaticoTapped), for: .touchUpInside) // Adiciona ação

        view.addSubview(meuBotaoProgramatico)

        NSLayoutConstraint.activate([
            meuBotaoProgramatico.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            meuBotaoProgramatico.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            meuBotaoProgramatico.widthAnchor.constraint(equalToConstant: 250),
            meuBotaoProgramatico.heightAnchor.constraint(equalToConstant: 50)
        ])

        // MARK: - Configurando botaonav do Storyboard

        // O botão já vem estilizado pela classe 'botaonav'.
        meuBotaoDoStoryboard.configure(withTitle: "Botão do Storyboard")
        meuBotaoDoStoryboard.addTarget(self, action: #selector(botaoStoryboardTapped), for: .touchUpInside) // Adiciona ação

        // Posiciona o botão do Storyboard (se você não tiver constraints já no Storyboard)
        meuBotaoDoStoryboard.translatesAutoresizingMaskIntoConstraints = false // Essencial se estiver adicionando constraints aqui
        NSLayoutConstraint.activate([
            meuBotaoDoStoryboard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            meuBotaoDoStoryboard.topAnchor.constraint(equalTo: meuBotaoProgramatico.bottomAnchor, constant: 20),
            meuBotaoDoStoryboard.widthAnchor.constraint(equalToConstant: 250),
            meuBotaoDoStoryboard.heightAnchor.constraint(equalToConstant: 50)
        ])

        // MARK: - Configurando ImagemFooter Programaticamente

        let minhaImagemProgramatica = ImagemFooter(frame: .zero)
        minhaImagemProgramatica.configure(withImage: UIImage(named: "333")) // Certifique-se de ter uma imagem "333" no Asset Catalog
        minhaImagemProgramatica.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(minhaImagemProgramatica)

        NSLayoutConstraint.activate([
            minhaImagemProgramatica.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minhaImagemProgramatica.topAnchor.constraint(equalTo: meuBotaoDoStoryboard.bottomAnchor, constant: 20),
            minhaImagemProgramatica.widthAnchor.constraint(equalToConstant: 100),
            minhaImagemProgramatica.heightAnchor.constraint(equalToConstant: 100)
        ])

        // MARK: - Configurando ImagemFooter do Storyboard

        // A imagem já vem estilizada pela classe 'ImagemFooter'.
        minhaImagemDoStoryboard.configure(withImage: UIImage(named: "333")) // Use a mesma imagem ou outra

        // Posiciona a imagem do Storyboard (se você não tiver constraints já no Storyboard)
        minhaImagemDoStoryboard.translatesAutoresizingMaskIntoConstraints = false // Essencial se estiver adicionando constraints aqui
        NSLayoutConstraint.activate([
            minhaImagemDoStoryboard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minhaImagemDoStoryboard.topAnchor.constraint(equalTo: minhaImagemProgramatica.bottomAnchor, constant: 20),
            minhaImagemDoStoryboard.widthAnchor.constraint(equalToConstant: 100),
            minhaImagemDoStoryboard.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // MARK: - Configurando UIProgressView do Storyboard (CORREÇÃO AQUI!)
        // Não crie uma nova instância. Use a que veio do Storyboard pelo @IBOutlet.
        
        myProgressView.progress = 0.7 // 70% completo
        myProgressView.progressTintColor = .systemGreen // Cor da barra preenchida
        myProgressView.trackTintColor = .systemGray // Cor da trilha vazia
        
        // **IMPORTANTE**: Se a altura da UIProgressView não estiver correta,
        // **verifique as constraints dela diretamente no Storyboard**.
        // É a forma mais garantida de controlar a altura.
        // Se você não tiver uma constraint de altura definida no Storyboard,
        // as linhas abaixo tentarão aplicá-la programaticamente.
        // Certifique-se de que não haja conflitos.
        myProgressView.translatesAutoresizingMaskIntoConstraints = false // Necessário se adicionar constraints aqui
        NSLayoutConstraint.activate([
            myProgressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myProgressView.topAnchor.constraint(equalTo: minhaImagemDoStoryboard.bottomAnchor, constant: 40),
            myProgressView.widthAnchor.constraint(equalToConstant: 300),
            myProgressView.heightAnchor.constraint(equalToConstant: 5) // Altura menor para a UIProgressView
        ])


        // MARK: - Configurando imgcard do Storyboard

        // Certifique-se de que o UIImageView no Storyboard está com a classe customizada 'imgcard'
        // e conectado ao @IBOutlet minhaNovaImagemCard.
        minhaNovaImagemCard.configure(withImage: UIImage(named: "seuNomeDeImagemAqui")) // Substitua "seuNomeDeImagemAqui" pela sua imagem desejada
        
        // Posiciona a imagem do Storyboard (se você não tiver constraints já no Storyboard)
        minhaNovaImagemCard.translatesAutoresizingMaskIntoConstraints = false // Essencial se estiver adicionando constraints aqui
        NSLayoutConstraint.activate([
            minhaNovaImagemCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minhaNovaImagemCard.topAnchor.constraint(equalTo: myProgressView.bottomAnchor, constant: 20),
            minhaNovaImagemCard.widthAnchor.constraint(equalToConstant: 150), // Largura da imagem
            minhaNovaImagemCard.heightAnchor.constraint(equalToConstant: 150) // Altura da imagem
        ])

        // MARK: - Configurando imgcard Programaticamente (Opcional)

        let minhaImagemCardProgramatica = imgcard(frame: .zero)
        minhaImagemCardProgramatica.configure(withImage: UIImage(named: "outraImagem")) // Use outra imagem se quiser
        minhaImagemCardProgramatica.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(minhaImagemCardProgramatica)

        NSLayoutConstraint.activate([
            minhaImagemCardProgramatica.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minhaImagemCardProgramatica.topAnchor.constraint(equalTo: minhaNovaImagemCard.bottomAnchor, constant: 20),
            minhaImagemCardProgramatica.widthAnchor.constraint(equalToConstant: 120),
            minhaImagemCardProgramatica.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    // MARK: - Estilo da Barra de Status (Horário Branco)

    override var preferredStatusBarStyle: UIStatusBarStyle {
        // Define o horário, ícones de Wi-Fi, bateria etc. como branco.
        // Certifique-se de que "View controller-based status bar appearance" no Info.plist esteja como YES.
        return .lightContent
    }

    // MARK: - Button Actions

    @objc func botaoProgramaticoTapped() {
        print("Botão criado programaticamente foi clicado!")
        // Adicione aqui a lógica específica para este botão
    }

    @objc func botaoStoryboardTapped() {
        print("Botão do Storyboard foi clicado!")
        // Adicione aqui a lógica específica para este botão
    }
}
