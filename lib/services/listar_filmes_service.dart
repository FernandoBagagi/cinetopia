import 'package:cinetopia/models/filme_model.dart';
import 'package:cinetopia/results/resultado.dart';

class ListarFilmesService {
  Future<Resultado<List<FilmeModel>, String>> listarFilmes() async {
    await Future.delayed(const Duration(seconds: 2));
    return Resultado.sucesso(_filmes);
  }
}

const _filmes = [
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3a',
    titulo: 'A Felicidade Não se Compra',
    descricao:
        'Um homem desesperado recebe a visita de um anjo que mostra como seria o mundo sem ele.',
    generos: ['Clássico', 'Drama', 'Fantasia'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3b',
    titulo: 'O Fabuloso Destino de Amélie Poulain',
    descricao:
        'Amélie decide mudar a vida das pessoas ao seu redor enquanto busca sua própria felicidade.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3c',
    titulo: 'Curtindo a Vida Adoidado',
    descricao:
        'Um estudante do ensino médio decide faltar à escola para viver um dia inesquecível.',
    generos: ['Comédia', 'Clássico'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3d',
    titulo: 'De Repente 30',
    descricao:
        'Após um desejo de aniversário, Jenna acorda com 30 anos e uma vida completamente diferente.',
    generos: ['Comédia', 'Romance', 'Fantasia'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3e',
    titulo: 'La La Land: Cantando Estações',
    descricao:
        'Um pianista de jazz e uma aspirante a atriz se apaixonam em Los Angeles.',
    generos: ['Romance', 'Musical', 'Drama'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3f',
    titulo: 'O Diário de uma Paixão',
    descricao:
        'Um casal enfrenta desafios ao longo dos anos, mas o amor verdadeiro prevalece.',
    generos: ['Romance', 'Drama'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3g',
    titulo: 'Se Beber, Não Case!',
    descricao:
        'Três amigos acordam sem memória após uma despedida de solteiro em Las Vegas.',
    generos: ['Comédia'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3h',
    titulo: 'Questão de Tempo',
    descricao:
        'Um jovem descobre que pode viajar no tempo e tenta melhorar sua vida amorosa.',
    generos: ['Romance', 'Comédia', 'Fantasia'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3i',
    titulo: 'O Grande Hotel Budapeste',
    descricao:
        'As aventuras de um concierge e seu protegido em um famoso hotel europeu.',
    generos: ['Comédia', 'Aventura'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3j',
    titulo: 'Meia-Noite em Paris',
    descricao:
        'Um roteirista viaja misteriosamente para a Paris dos anos 1920 todas as noites.',
    generos: ['Comédia', 'Romance', 'Fantasia'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3k',
    titulo: 'Simplesmente Amor',
    descricao:
        'Várias histórias de amor se entrelaçam durante o Natal em Londres.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3l',
    titulo: 'O Lado Bom da Vida',
    descricao:
        'Após sair de uma instituição psiquiátrica, Pat tenta reconstruir sua vida.',
    generos: ['Comédia', 'Drama', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3m',
    titulo: 'As Vantagens de Ser Invisível',
    descricao:
        'Um adolescente tímido faz novos amigos e descobre o valor da amizade.',
    generos: ['Drama', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3n',
    titulo: '10 Coisas que Eu Odeio em Você',
    descricao:
        'Um jovem tenta conquistar a irmã de uma garota popular para poder namorar.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3o',
    titulo: 'Um Lugar Chamado Notting Hill',
    descricao:
        'A vida de um livreiro muda ao conhecer uma famosa atriz de cinema.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3p',
    titulo: 'De Volta para o Futuro',
    descricao:
        'Um adolescente viaja no tempo e precisa garantir que seus pais se apaixonem.',
    generos: ['Comédia', 'Aventura', 'Ficção Científica'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3q',
    titulo: 'A Princesa Prometida',
    descricao:
        'Uma história de amor, aventura e fantasia em um reino distante.',
    generos: ['Aventura', 'Romance', 'Fantasia'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3r',
    titulo: 'O Casamento do Meu Melhor Amigo',
    descricao:
        'Uma mulher percebe que ama seu melhor amigo quando ele anuncia seu casamento.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3s',
    titulo: 'A Proposta',
    descricao:
        'Uma editora finge um casamento com seu assistente para evitar deportação.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3t',
    titulo: 'Se Eu Ficar',
    descricao:
        'Após um acidente, uma jovem precisa decidir entre viver ou partir.',
    generos: ['Drama', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3u',
    titulo: 'Para Todos os Garotos que Já Amei',
    descricao:
        'As cartas de amor secretas de uma adolescente são enviadas para seus antigos crushes.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3v',
    titulo: 'O Amor Não Tira Férias',
    descricao:
        'Duas mulheres trocam de casa e encontram novos amores em outros países.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3w',
    titulo: 'Como Perder um Homem em 10 Dias',
    descricao:
        'Uma jornalista e um publicitário entram em um relacionamento por motivos opostos.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3x',
    titulo: 'Ela',
    descricao:
        'Um homem solitário se apaixona por um sistema operacional inteligente.',
    generos: ['Drama', 'Romance', 'Ficção Científica'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3y',
    titulo: 'A Nova Cinderela',
    descricao:
        'Uma jovem enfrenta desafios para realizar seus sonhos e encontrar o amor.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c3z',
    titulo: 'O Diário da Princesa',
    descricao: 'Uma adolescente descobre que é herdeira de um reino europeu.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c31',
    titulo: 'A Barraca do Beijo',
    descricao: 'Uma adolescente se apaixona pelo irmão de seu melhor amigo.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c32',
    titulo: 'Questão de Tempo',
    descricao:
        'Um jovem descobre que pode viajar no tempo e tenta melhorar sua vida amorosa.',
    generos: ['Comédia', 'Romance', 'Fantasia'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c33',
    titulo: 'O Melhor Amigo da Noiva',
    descricao:
        'Um homem percebe que ama sua melhor amiga quando ela fica noiva.',
    generos: ['Comédia', 'Romance'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c34',
    titulo: 'Sim Senhor',
    descricao:
        'Um homem decide dizer "sim" para todas as oportunidades que aparecem.',
    generos: ['Comédia'],
  ),
  FilmeModel(
    id: 'c2e7b6e2-8f7d-4e3a-9b2e-7d1a4f2e9c35',
    titulo: 'A Escolha Perfeita',
    descricao:
        'Um grupo de garotas forma um grupo de canto a capella e enfrenta desafios musicais.',
    generos: ['Comédia', 'Musical'],
  ),
];
