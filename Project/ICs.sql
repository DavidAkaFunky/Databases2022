CREATE OR REPLACE FUNCTION chk_category_supercat_of_itself_proc()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.categoria == NEW.super_categoria THEN
        RAISE EXCEPTION 'A category is super category of itself'
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION chk_rep_event_units_does_not_exceed_planogram_units_proc()
RETURNS TRIGGER AS
$$
BEGIN
    SELECT unidades 
    INTO unidades_planograma
    FROM planograma
    WHERE ean = NEW.ean
      AND nro = NEW.nro
      AND num_serie = NEW.num_serie
      AND fabricante = NEW.fabricante;
    IF NEW.unidades > unidades_planograma THEN
        RAISE EXCEPTION 'Replenishment event units exceeds planogram units'
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION chk_rep_product_in_shelf_with_product_category_proc()
RETURNS TRIGGER AS
$$
BEGIN
    SELECT COUNT(nome)
    INTO count_category
    FROM tem_categoria
    WHERE ean = NEW.ean
      AND nome IN (SELECT nome
                   FROM prateleira
                   WHERE nro = NEW.nro
                     AND num_serie = NEW.num_serie
                     AND fabricante = NEW.fabricante);

    IF count_category == 0 THEN
        RAISE EXCEPTION 'Product is replenished in a shelf without any of the product`s categories'
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER chk_category_supercat_of_itself_trigger
BEFORE UPDATE OR INSERT ON tem_outra
FOR EACH ROW EXECUTE PROCEDURE chk_category_supercat_of_itself_proc();

CREATE TRIGGER chk_rep_event_units_does_not_exceed_planogram_units_trigger
BEFORE UPDATE OR INSERT ON evento_reposicao
FOR EACH ROW EXECUTE PROCEDURE chk_rep_event_units_does_not_exceed_planogram_units_proc();

CREATE TRIGGER chk_rep_product_in_shelf_with_product_category_trigger
BEFORE UPDATE OR INSERT ON evento_reposicao
FOR EACH ROW EXECUTE PROCEDURE chk_rep_product_in_shelf_with_product_category_proc();