import { Controller, Get } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { AppService } from './app.service';

@ApiTags('health')
@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @ApiOperation({ summary: 'Health check' })
  getHealth() {
    return this.appService.getHealth();
  }

  @Get('api')
  @ApiOperation({ summary: 'API info' })
  getInfo() {
    return {
      name: 'SvelteKit-NestJS-Turbo API',
      version: '1.0.0',
      timestamp: new Date().toISOString(),
    };
  }
}
