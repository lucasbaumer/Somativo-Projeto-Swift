import Foundation

enum TipoMensagem{
    case promocao, lembrete, alerta
}

struct Mensagem{
    var tipo : TipoMensagem
    var conteudo : String
}

protocol Notificavel{
    var mensagem : Mensagem { get }
    var prioridade : Prioridade { get }
    func enviarNotificacao()
}

enum Prioridade: String{
    case baixa = "Baixa"
    case media = "Média"
    case alta = "Alta"
}

extension Notificavel{
    func enviarNotificacao(){
        print("Enviando notificação...")
    }
}

struct Email: Notificavel{
    var mensagem : Mensagem
    var prioridade : Prioridade
    var enderecoEmail : String

    func enviarNotificacao(){
        print("Enviando email para \(enderecoEmail): \(mensagem.conteudo) - Prioridade: \(prioridade.rawValue)")
    }
}

struct PushNotification: Notificavel {
    var mensagem: Mensagem
    var prioridade: Prioridade
    var TokenDispositivo: String

    func enviarNotificacao() {
        print("Enviando push para \(TokenDispositivo): \(mensagem.conteudo) - Prioridade: \(prioridade.rawValue)")
    }
}

struct SMS: Notificavel{
    var mensagem : Mensagem
    var prioridade : Prioridade
    var numeroTelefone : String

    func enviarNotificacao() {
        print("Enviando SMS para \(numeroTelefone): \(mensagem.conteudo) - Prioridade: \(prioridade.rawValue)")
    }
}

func filtrarCanais<T: Notificavel>(canais: [Notificavel], tipo: T.Type) -> [T] {
    return canais.compactMap { $0 as? T }
}

let mensagem1 = Mensagem(tipo: .promocao, conteudo: "Promoção de desconto de 20%!")
let mensagem2 = Mensagem(tipo: .alerta, conteudo:"Sua senha expirou!")

let canais:[Notificavel] = [
    Email(mensagem: mensagem1, prioridade: .alta, enderecoEmail: "xcvkp@example.com"),
    SMS(mensagem: mensagem2, prioridade: .media, numeroTelefone: "5551999999999"),
    PushNotification(mensagem: mensagem2, prioridade: .baixa, TokenDispositivo:"1234")
]

for canal in canais{
    canal.enviarNotificacao()
}

let emails = filtrarCanais(canais: canais, tipo: Email.self)

print("\nCanais de email filtrados:")
for email in emails {
    email.enviarNotificacao()
}