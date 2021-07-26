import { Controller, Get} from '@nestjs/common';
import { PlayersService } from './players.service';

@Controller('players')
export class PlayersController {
  constructor(private readonly playersService: PlayersService) {}

  @Get()
  async findAll() {
    return await this.playersService.getPlayers();
  }
}
