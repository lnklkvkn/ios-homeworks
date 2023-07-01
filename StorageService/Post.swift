//
//  Post.swift
//  Navigation
//
//  Created by ln on 08.09.2022.
//

import Foundation

public struct Post {
    
    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int
    
    public init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }

}

enum Autors: String {
    case a = "Kulik"
    case b = "Pupa.official"
    case c = "Lupa.Pupa"
    case d = "Masha.Lipova"
}



enum Descriptions: String {
case lermontov =
    "Лермонтов Михаил Юрьевич (1814 - 1841) - потомок шотландского рода, основанного поэтом и пророком Лермонтом, родился в Москве. Воспитывала его суровая бабушка, которая считала виновником смерти матери будущего поэта его отца и не разрешала им видеться. В возрасте десяти лет первый раз влюбился, что оставило в душе поэта след на всю жизнь. Учился Лермонтов в Московском университете, а до этого в частном пансионе, где начал писать «Демона». Неудачная любовь послужила толчком к «ивановскому» циклу стихов. Получение образования также столкнулось с трудностями. Из-за неприятной истории студент Лермонтов покинул университет и поступил в школу гвардейских подпрапорщиков."
    
case gogol =
    "Гоголь Николай Васильевич (1809-1852). Многие из героев его книг живут в зыбком потустороннем мире. Мистический ореол сопровождал творца всю его жизнь. А тайны остались неразгаданными даже после смерти.Великий русский писатель Николай Васильевич Гоголь родился в 1809 году в малороссийской дворянской семье. Местный фольклор послужил основой для сборника «Вечера на хуторе близ Диканьки» (1832) и принес ему первый успех. Но путь к этому успеху был долог."
    
case dostoevsky =
    "Достоевский Федор Михайлович (1821–1881). Пророк и писатель, который достижение счастья видел не иначе как через страдание, был неутомимым защитником добра. Настолько ярым, что многие приписали Федору Достоевскому противопоставление целого мира слезинке ребенка. Однако мало кто сравнится с подобным защитником в понимании и объяснении причин существующего в этом мире зла.Достоевский родился в семье военного врача, который выслужил потомственное дворянство. После смерти матери Федор Михайлович поступает в инженерное училище в Петербурге. Вместе с товарищами он организует литературный кружок, занимается переводами. В 1845 году Достоевский публикует первый роман «Бедные люди». К этому времени он вышел в отставку, чтобы заняться творчеством. Однако связь с революционным движением привела к аресту писателя в 1849 году."
    
case chehov =
    "Чехов Антон Павлович (1860-1904). Брат моего брата, Человек без селезенки, А Ч-в, Антоша Чехонте и еще десятки псевдонимов скрывали настоящую имя и фамилию писателя, произведения которого до сих пор находят миллионы поклонников. Антон Чехов родился в Таганроге, в семье бакалейщика. В 1868 году он поступил в греческую гимназию, которую заканчивал уже самостоятельным человеком. Дело в том, что его отец разорился и подался в Москву, оставив сыну долги и расчет с кредиторами."
    
}

enum Image: String {
    case lermontov = "Lermontov"
    case gogol = "Gogol"
    case dostoevsky = "Dostoevsky"
    case chehov = "Chehov"
}

enum Likes: Int {
    case a = 8475
    case b = 346
    case c = 3473
    case d = 242
}

enum Views: Int {
    case a = 9475
    case b = 946
    case c = 9473
    case d = 942
}

var postA = Post(author: Autors.a.rawValue, description: Descriptions.chehov.rawValue, image: Image.chehov.rawValue, likes: Likes.a.rawValue, views: Views.a.rawValue)

var postB = Post(author: Autors.b.rawValue, description: Descriptions.gogol.rawValue, image: Image.gogol.rawValue, likes: Likes.b.rawValue, views: Views.b.rawValue)

var postC = Post(author: Autors.c.rawValue, description: Descriptions.lermontov.rawValue, image: Image.lermontov.rawValue, likes: Likes.c.rawValue, views: Views.c.rawValue)

var postD = Post(author: Autors.d.rawValue, description: Descriptions.dostoevsky.rawValue, image: Image.dostoevsky.rawValue, likes: Likes.d.rawValue, views: Views.d.rawValue)

public let viewModel = [postA, postB, postC, postD]
public let reservedImages = ["Chechov2", "Gogol2", "Lermontov2", "Dostoevsky2"]
