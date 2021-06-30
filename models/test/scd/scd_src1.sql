with 
src as
(
          select '0349' as zweigstelle_nummer, 'Dortmund Ost' as zweigstelle_name, 'blau'  as farbe_aussenwand, '2021-03-30' as bearbeitungsdatum
)

select *
from src