/* -----------------------------------------------------------------------
ÀÛ¼ºÀÏ : 2022³â 12¿ù 16ÀÏ
ÀÛ¼ºÀÚ : ÀÌ°üÈñ
±â  ´É : ³×ºñ°ÔÀÌ¼Ç, Å°¿À½ºÅ©µî¿¡ È°¿ëÇÒ ÃÊ¼º °Ë»ö ÇÔ¼ö

SELECT °á°ú = [DBO].[UF_ÃÊ¼ºÁ¶È¸] ('¾Æ¹öÁö')
--------------------------------------------------------------------------*/
CREATE FUNCTION [DBO].[UF_ÃÊ¼ºÁ¶È¸] (@ÀÔ·Â¹®ÀÚ NVARCHAR(500))
	RETURNS	NVARCHAR(500)
AS
BEGIN

	DECLARE  @¹®ÀÚ±æÀÌ	INTEGER
			,@º¯È¯À§Ä¡	INTEGER
			,@º¯È¯¹®ÀÚ	NVARCHAR(1)

	DECLARE	@ÃÊ¼º°á°ú	NVARCHAR(200) = ''
	SSS
	SET @¹®ÀÚ±æÀÌ = LEN(@ÀÔ·Â¹®ÀÚ)
	SET @º¯È¯À§Ä¡ = 0
	SET @ÃÊ¼º°á°ú = ''

	WHILE 1 = 1 BEGIN

		SET @º¯È¯À§Ä¡ = @º¯È¯À§Ä¡ + 1

		IF (@º¯È¯À§Ä¡ > @¹®ÀÚ±æÀÌ OR @º¯È¯À§Ä¡ > 100) BREAK

		SET @º¯È¯¹®ÀÚ = UPPER(SUBSTRING(@ÀÔ·Â¹®ÀÚ, @º¯È¯À§Ä¡, 1))

		IF (@º¯È¯¹®ÀÚ >= '°¡' AND @º¯È¯¹®ÀÚ <= 'ƒ‰') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤¡'
   ELSE IF (@º¯È¯¹®ÀÚ >= '³ª' AND @º¯È¯¹®ÀÚ <= 'ˆ¢') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤¤'
   ELSE IF (@º¯È¯¹®ÀÚ >= '´Ù' AND @º¯È¯¹®ÀÚ <= '‹L') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤§'
   ELSE IF (@º¯È¯¹®ÀÚ >= '¶ó' AND @º¯È¯¹®ÀÚ <= '¡') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤©'
   ELSE IF (@º¯È¯¹®ÀÚ >= '¸¶' AND @º¯È¯¹®ÀÚ <= '“J') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤±'
   ELSE IF (@º¯È¯¹®ÀÚ >= '¹Ù' AND @º¯È¯¹®ÀÚ <= '•½') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤²'
   ELSE IF (@º¯È¯¹®ÀÚ >= '»ç' AND @º¯È¯¹®ÀÚ <= 'šï') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤µ'
   ELSE IF (@º¯È¯¹®ÀÚ >= '¾Æ' AND @º¯È¯¹®ÀÚ <= 'Ÿç') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤·'
   ELSE IF (@º¯È¯¹®ÀÚ >= 'ÀÚ' AND @º¯È¯¹®ÀÚ <= '£ ') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤¸'
   ELSE IF (@º¯È¯¹®ÀÚ >= 'Â÷' AND @º¯È¯¹®ÀÚ <= '¯†') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤º'
   ELSE IF (@º¯È¯¹®ÀÚ >= 'Ä«' AND @º¯È¯¹®ÀÚ <= 'µi') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤»'
   ELSE IF (@º¯È¯¹®ÀÚ >= 'Å¸' AND @º¯È¯¹®ÀÚ <= '»M') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤¼'
   ELSE IF (@º¯È¯¹®ÀÚ >= 'ÆÄ' AND @º¯È¯¹®ÀÚ <= 'À˜') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤½'
   ELSE IF (@º¯È¯¹®ÀÚ >= 'ÇÏ' AND @º¯È¯¹®ÀÚ <= 'ÆR') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤¾'
   ELSE IF (@º¯È¯¹®ÀÚ >= 'ºü' AND @º¯È¯¹®ÀÚ <= '˜ª') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤³'
   ELSE IF (@º¯È¯¹®ÀÚ >= '½Î' AND @º¯È¯¹®ÀÚ <= 'Ï') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤¶'
   ELSE IF (@º¯È¯¹®ÀÚ >= 'Â¥' AND @º¯È¯¹®ÀÚ <= 'Âö') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + '¤¹'
   ELSE IF (@º¯È¯¹®ÀÚ >= 'A'  AND @º¯È¯¹®ÀÚ <= 'Z') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + @º¯È¯¹®ÀÚ
   ELSE IF (@º¯È¯¹®ÀÚ >= '0'  AND @º¯È¯¹®ÀÚ <= '9') SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + @º¯È¯¹®ÀÚ
   ELSE												SET @ÃÊ¼º°á°ú = @ÃÊ¼º°á°ú + @º¯È¯¹®ÀÚ
END

RETURN	@ÃÊ¼º°á°ú
END
	