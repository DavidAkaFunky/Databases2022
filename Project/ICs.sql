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
    IF /* ??? */ THEN
        RAISE EXCEPTION 'Replenishment event units exceeds planogram units'
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION chk_rep_product_in_shelf_with_product_category_proc()
RETURNS TRIGGER AS
$$
BEGIN
    IF /* ??? */ THEN
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