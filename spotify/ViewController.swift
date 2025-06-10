//
//  ViewController.swift
//  spotify
//
//  Created by COTEMIG on 03/06/25.
//

import UIKit

// MARK: - botaonav Class

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
        // Estilização básica
        backgroundColor = .systemBlue // Cor de fundo padrão
        setTitleColor(.white, for: .normal) // Cor do texto
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold) // Fonte do texto

        // Configurações de borda e arredondamento
        layer.cornerRadius = 13 // Raio de arredondamento (15 pontos)
        layer.masksToBounds = true // Crucial para cortar o conteúdo ao raio
        layer.borderWidth = 1 // Largura da borda (1 ponto)
        layer.borderColor = UIColor.black.cgColor // Cor da borda
    }

    // Você pode adicionar métodos para configurar texto ou outras propriedades
    func configure(withTitle title: String) {
        setTitle(title, for: .normal)
    }
}

// MARK: - ImagemFooter Class

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
        // Configura corner radius para a imagem
        layer.cornerRadius = 10 // Raio de arredondamento, ajuste conforme necessário
        layer.masksToBounds = true // Essencial para cortar o conteúdo ao raio

        // Opcional: Adicionar uma borda à imagem
        layer.borderWidth = 1 // Largura da borda (1 ponto)
        layer.borderColor = UIColor.lightGray.cgColor // Cor da borda
    }

    // Método para configurar a imagem
    func configure(withImage image: UIImage?) {
        self.image = image
    }
}

// MARK: - MyViewController Class

class MyViewController: UIViewController {

    // MARK: - IBOutlets

    // 1. Crie um @IBOutlet para o seu botão do Storyboard
    // No Main.storyboard:
    // - Arraste um UIButton para o seu ViewController.
    // - No Identity Inspector (terceiro ícone à direita), mude a classe para 'botaonav'.
    // - Arraste do círculo ao lado de 'meuBotaoDoStoryboard' para o botão no Storyboard para conectar.
    @IBOutlet weak var meuBotaoDoStoryboard: botaonav!

    // 2. Crie um @IBOutlet para a sua imagem do Storyboard (se aplicável)
    // No Main.storyboard:
    // - Arraste um UIImageView para o seu ViewController.
    // - No Identity Inspector, mude a classe para 'ImagemFooter'.
    // - Arraste do círculo ao lado de 'minhaImagemDoStoryboard' para a imagem no Storyboard para conectar.
    @IBOutlet weak var minhaImagemDoStoryboard: ImagemFooter!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5 // Apenas para ter um fundo visível

        // MARK: - Usando botaonav Programaticamente

        // Passamos 'frame: .zero' porque estamos usando Auto Layout
        let meuBotaoProgramatico = botaonav(frame: .zero)
        meuBotaoProgramatico.configure(withTitle: "Botão do Código")
        meuBotaoProgramatico.translatesAutoresizingMaskIntoConstraints = false // Essencial para Auto Layout
        meuBotaoProgramatico.addTarget(self, action: #selector(botaoProgramaticoTapped), for: .touchUpInside) // Adiciona ação

        view.addSubview(meuBotaoProgramatico)

        NSLayoutConstraint.activate([
            meuBotaoProgramatico.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            meuBotaoProgramatico.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            meuBotaoProgramatico.widthAnchor.constraint(equalToConstant: 250), // Aumentei a largura para 250
            meuBotaoProgramatico.heightAnchor.constraint(equalToConstant: 50)
        ])

        // MARK: - Usando botaonav do Storyboard

        // Se o @IBOutlet 'meuBotaoDoStoryboard' foi conectado corretamente no Storyboard,
        // ele já virá com a estilização definida na classe 'botaonav'.
        // Você só precisa configurar o título e adicionar uma ação, se quiser.
        meuBotaoDoStoryboard.configure(withTitle: "Botão do Storyboard")
        meuBotaoDoStoryboard.addTarget(self, action: #selector(botaoStoryboardTapped), for: .touchUpInside) // Adiciona ação

        // Exemplo de como posicionar o botão do Storyboard (se você não tiver constraints no Storyboard)
        // Se você já tem constraints no Storyboard, não precisa disso.
        NSLayoutConstraint.activate([
            meuBotaoDoStoryboard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            meuBotaoDoStoryboard.topAnchor.constraint(equalTo: meuBotaoProgramatico.bottomAnchor, constant: 20),
            meuBotaoDoStoryboard.widthAnchor.constraint(equalToConstant: 250),
            meuBotaoDoStoryboard.heightAnchor.constraint(equalToConstant: 50)
        ])

        // MARK: - Usando ImagemFooter Programaticamente

        // Passamos 'frame: .zero' porque estamos usando Auto Layout
        let minhaImagemProgramatica = ImagemFooter(frame: .zero)
        // Usando a imagem "333"
        minhaImagemProgramatica.configure(withImage: UIImage(named: "333"))
        minhaImagemProgramatica.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(minhaImagemProgramatica)

        NSLayoutConstraint.activate([
            minhaImagemProgramatica.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minhaImagemProgramatica.topAnchor.constraint(equalTo: meuBotaoDoStoryboard.bottomAnchor, constant: 20),
            minhaImagemProgramatica.widthAnchor.constraint(equalToConstant: 100), // Largura da imagem
            minhaImagemProgramatica.heightAnchor.constraint(equalToConstant: 100) // Altura da imagem
        ])

        // MARK: - Usando ImagemFooter do Storyboard

        // Se o @IBOutlet 'minhaImagemDoStoryboard' foi conectado corretamente no Storyboard,
        // ele já virá com a estilização definida na classe 'ImagemFooter' (com o cornerRadius).
        // Você só precisa configurar a imagem.
        // Usando a imagem "333"
        minhaImagemDoStoryboard.configure(withImage: UIImage(named: "333"))

        // Exemplo de como posicionar a imagem do Storyboard (se você não tiver constraints no Storyboard)
        NSLayoutConstraint.activate([
            minhaImagemDoStoryboard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minhaImagemDoStoryboard.topAnchor.constraint(equalTo: minhaImagemProgramatica.bottomAnchor, constant: 20),
            minhaImagemDoStoryboard.widthAnchor.constraint(equalToConstant: 100),
            minhaImagemDoStoryboard.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    // MARK: - Button Actions

    @objc func botaoProgramaticoTapped() {
        print("Botão criado programaticamente foi clicado!")
        // Adicione aqui a lógica que você quer para este botão
    }

    @objc func botaoStoryboardTapped() {
        print("Botão do Storyboard foi clicado!")
        // Adicione aqui a lógica que você quer para este botão
    }
}
