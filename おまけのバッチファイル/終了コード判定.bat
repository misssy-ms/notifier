@echo off
rem (c) 2025 misssy-ms All rights reserved. Version 1.1
setlocal
set /p argument=�m�F�����������͂��Ă�������:
set /p var=����:%argument%�Ŏ��s���܂��notifier.exe�����邱�Ƃ��m�F���Ă��������
start /wait notifier.exe %argument%
set code=%errorlevel%
if %code%==0 (
  echo �I���R�[�h: %code%
  echo ����ɏI�����܂����
  echo �G���[: ����܂���
  echo ���[�U�[�A�N�V����: ����܂���
) else if %code%==11 (
  echo �I���R�[�h: %code%
  echo ��肪�����������ߤ�ʒm�𑗐M�ł��܂���ł����
  echo �G���[: �A�C�R�����g�p�ł��܂���ł�����t�@�C���p�X�̊m�F�����Ă��������
  echo ���[�U�[�A�N�V����: ����܂���
  echo [TIP] .ico�t�@�C���̓T�|�[�g���Ă��܂���.png���g�p���Ă��������
) else if %code%==12 (
  echo �I���R�[�h: %code%
  echo ��肪�����������ߤ�ʒm�𑗐M�ł��܂���ł����
  echo �G���[: �摜���g�p�ł��܂���ł�����t�@�C���p�X�̊m�F�����Ă��������
  echo ���[�U�[�A�N�V����: ����܂���
) else if %code%==13 (
  echo �I���R�[�h: %code%
  echo ��肪�����������ߤ�ʒm�𑗐M�ł��܂���ł����
  echo �G���[: �I�[�f�B�I�t�@�C�����g�p�ł��܂���ł�����t�@�C���p�X�̊m�F�����Ă��������
  echo ���[�U�[�A�N�V����: ����܂���
  echo [TIP] �t�@�C���`����".wav"����������܂��
) else if %code%==14 (
  echo �I���R�[�h: %code%
  echo ��肪�����������ߤ�ʒm�𑗐M�ł��܂���ł����
  echo �G���[: �s���ȃG���[�ł���ʒm�𑗐M�ł��܂���ł����
  echo ���[�U�[�A�N�V����: ����܂���
  echo [TIP] ���s���Ă���PC���v���𖞂����Ă��邱�Ƃ��m�F���Ă��������
) else if %code%==15 (
  echo �I���R�[�h: %code%
  echo ��肪�����������ߤ�ʒm�𑗐M�ł��܂���ł����
  echo �G���[: �s���Ȉ����headerid�̒l��1000�ȏ�ł���K�v������܂��
  echo ���[�U�[�A�N�V����: ����܂���
  echo [TIP] �\�[�X�R�[�h��ύX����999�ȉ����g�p�ł���悤�ɂȂ�܂��
) else if %code%==16 (
  echo �I���R�[�h: %code%
  echo ��肪�����������ߤ�ʒm�𑗐M�ł��܂���ł����
  echo �G���[: �s���Ȉ����ł���ʒm�𑗐M�ł��܂���ł����
  echo ���[�U�[�A�N�V����: ����܂���
) else if %code%==17 (
  echo �I���R�[�h: %code%
  echo ��肪�����������ߤ�ʒm�𑗐M�ł��܂���ł����
  echo �G���[: �s���ȃG���[�ł���ʒm�̓���𔻒�ł��܂���ł����
  echo ���[�U�[�A�N�V����: ����܂���
) else if %code%==18 (
  echo �I���R�[�h: %code%
  echo ��肪�����������ߤ�ʒm�𑗐M�ł��܂���ł����
  echo �G���[: �e�L�X�g�{�b�N�X�̓��e���o�͂ł��܂���ł�����ʒm�͑��M����܂����
  echo ���[�U�[�A�N�V����: ����܂���
) else if %code%==20 (
  echo �I���R�[�h: %code%
  echo ���Ȃ����M���꤃e�L�X�g�{�b�N�X�̓��e���o�͂ł��܂����
  echo �G���[: ����܂���
  echo ���[�U�[�A�N�V����: �e�L�X�g�{�b�N�X�̓��e^(notifier.txt^)
  type notifier.txt || echo �t�@�C����ǂݍ��߂܂���t�@�C�������݂��Ȃ��ꍇ��notifier�ɖ�肪����\��������܂��
  echo [TIP] �����������Ă���ꍇ�̓G���R�[�h���Ԉ���Ă���\��������܂��"--shiftjis"��ǉ����Ă��������
) else if %code%==21 (
  echo �I���R�[�h: %code%
  echo ���Ȃ����M���꤃{�^�����N���b�N���܂����
  echo �G���[: ����܂���
  echo ���[�U�[�A�N�V����: �{�^��1^(btn1^)���N���b�N
) else if %code%==22 (
  echo �I���R�[�h: %code%
  echo ���Ȃ����M���꤃{�^�����N���b�N���܂����
  echo �G���[: ����܂���
  echo ���[�U�[�A�N�V����: �{�^��2^(btn2^)���N���b�N
) else if %code%==23 (
  echo �I���R�[�h: %code%
  echo ���Ȃ����M���꤃{�^�����N���b�N���܂����
  echo �G���[: ����܂���
  echo ���[�U�[�A�N�V����: �{�^��3^(btn3^)���N���b�N
) else if %code%==24 (
  echo �I���R�[�h: %code%
  echo ���Ȃ����M���꤃{�^�����N���b�N���܂����
  echo �G���[: ����܂���
  echo ���[�U�[�A�N�V����: �{�^��4^(btn4^)���N���b�N
) else (
  echo [ERROR] �s���ȏI���R�[�h:%code%
  echo [TIP] taskkill�Ȃǂŋ����I������Ă���\��������܂��
)
pause
endlocal
exit /b
