CREATE OR REPLACE FUNCTION create_category_for_simple_or_super_proc()
RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO categoria VALUES (NEW.nome);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION chk_simple_category_is_not_super_category_proc()
    RETURNS TRIGGER AS
$$
BEGIN
    IF EXISTS (SELECT nome
               FROM super_categoria
               WHERE nome = NEW.nome)
    THEN
        RAISE EXCEPTION 'Simple category already exists as super category';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION chk_super_category_is_not_simple_category_proc()
    RETURNS TRIGGER AS
$$
BEGIN
    IF EXISTS (SELECT nome
               FROM categoria_simples
               WHERE nome = NEW.nome)
    THEN
        RAISE EXCEPTION 'Super category already exists as simple category';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION chk_category_supercat_of_itself_proc()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.categoria = NEW.super_categoria THEN
        RAISE EXCEPTION 'A category is super category of itself';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION chk_rep_event_units_does_not_exceed_planogram_units_proc()
RETURNS TRIGGER AS
$$
DECLARE unidades_planograma INT;
BEGIN
    SELECT unidades 
    INTO unidades_planograma
    FROM planograma
    WHERE ean = NEW.ean
      AND nro = NEW.nro
      AND num_serie = NEW.num_serie
      AND fabricante = NEW.fabricante;
    IF NEW.unidades > unidades_planograma THEN
        RAISE EXCEPTION 'Replenishment event units exceeds planogram units';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION chk_rep_product_in_shelf_with_product_category_proc()
RETURNS TRIGGER AS
$$
BEGIN
    IF NOT EXISTS (SELECT nome
    FROM tem_categoria
    WHERE ean = NEW.ean
      AND nome IN (SELECT nome
                   FROM prateleira
                   WHERE nro = NEW.nro
                     AND num_serie = NEW.num_serie
                     AND fabricante = NEW.fabricante))
    THEN
        RAISE EXCEPTION 'Product is replenished in a shelf without any of the product`s categories';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS create_category_for_simple_or_super_trigger ON categoria_simples;
CREATE TRIGGER create_category_for_simple_or_super_trigger
BEFORE UPDATE OR INSERT ON categoria_simples
FOR EACH ROW EXECUTE PROCEDURE create_category_for_simple_or_super_proc();

DROP TRIGGER IF EXISTS create_category_for_simple_or_super_trigger ON super_categoria;
CREATE TRIGGER create_category_for_simple_or_super_trigger
BEFORE UPDATE OR INSERT ON super_categoria
FOR EACH ROW EXECUTE PROCEDURE create_category_for_simple_or_super_proc();

DROP TRIGGER IF EXISTS chk_simple_category_is_not_super_category_trigger ON categoria_simples;
CREATE TRIGGER chk_simple_category_is_not_super_category_trigger
BEFORE UPDATE OR INSERT ON categoria_simples
FOR EACH ROW EXECUTE PROCEDURE chk_simple_category_is_not_super_category_proc();

DROP TRIGGER IF EXISTS chk_super_category_is_not_simple_category_trigger ON super_categoria;
CREATE TRIGGER chk_super_category_is_not_simple_category_trigger
BEFORE UPDATE OR INSERT ON super_categoria
FOR EACH ROW EXECUTE PROCEDURE chk_super_category_is_not_simple_category_proc();

DROP TRIGGER IF EXISTS chk_category_supercat_of_itself_trigger ON tem_outra;
CREATE TRIGGER chk_category_supercat_of_itself_trigger
BEFORE UPDATE OR INSERT ON tem_outra
FOR EACH ROW EXECUTE PROCEDURE chk_category_supercat_of_itself_proc();

DROP TRIGGER IF EXISTS chk_rep_event_units_does_not_exceed_planogram_units_trigger ON evento_reposicao;
CREATE TRIGGER chk_rep_event_units_does_not_exceed_planogram_units_trigger
BEFORE UPDATE OR INSERT ON evento_reposicao
FOR EACH ROW EXECUTE PROCEDURE chk_rep_event_units_does_not_exceed_planogram_units_proc();

DROP TRIGGER IF EXISTS chk_rep_product_in_shelf_with_product_category_trigger ON evento_reposicao;
CREATE TRIGGER chk_rep_product_in_shelf_with_product_category_trigger
BEFORE UPDATE OR INSERT ON evento_reposicao
FOR EACH ROW EXECUTE PROCEDURE chk_rep_product_in_shelf_with_product_category_proc();